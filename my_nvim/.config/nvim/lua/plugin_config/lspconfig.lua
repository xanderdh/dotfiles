local servers = { "html", "cssls", "ts_ls", "jdtls", "yamlls", "pylsp" }

local M = {}
local map = vim.keymap.set

-- export on_attach & capabilities
M.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
  map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
  map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts("List workspace folders"))

  map("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))
  -- TODO: implement global rename keymap
  -- map("n", "<leader>ra", require("nvchad.lsp.renamer"), opts("NvRenamer"))

  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
  map("n", "gr", vim.lsp.buf.references, opts("Show references"))
end

-- disable semanticTokens
M.on_init = function(client, _)
  if client.supports_method("textDocument/semanticTokens") then
    client.server_capabilities.semanticTokensProvider = nil
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

M.defaults = function()
  -- Migration note:
  -- nvim-lspconfig v3 will remove the legacy `require('lspconfig').<server>.setup{}` calls.
  -- Preferred API (Nvim 0.11+):
  --   vim.lsp.config('<server>', { ... })  -- define/extend config
  --   vim.lsp.enable('<server>')            -- enable config
  -- We keep a fallback for older versions (<=0.10) that don't expose vim.lsp.config.

  local lua_settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          vim.fn.expand("$VIMRUNTIME/lua"),
          vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
          vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
          "${3rd}/luv/library",
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  }

  if vim.lsp and vim.lsp.config and vim.lsp.enable then
    -- New API path
    vim.lsp.config("lua_ls", {
      on_attach = M.on_attach,
      capabilities = M.capabilities,
      on_init = M.on_init,
      settings = lua_settings,
    })
    vim.lsp.enable("lua_ls")

    for _, lsp in ipairs(servers) do
      vim.lsp.config(lsp, {
        on_attach = M.on_attach,
        on_init = M.on_init,
        capabilities = M.capabilities,
      })
      vim.lsp.enable(lsp)
    end
  else
    -- Legacy fallback
    local ok, lspconfig = pcall(require, "lspconfig")
    if not ok then
      vim.schedule(function()
        vim.notify("lspconfig not found; LSP servers not configured", vim.log.levels.ERROR)
      end)
      return
    end

    lspconfig.lua_ls.setup({
      on_attach = M.on_attach,
      capabilities = M.capabilities,
      on_init = M.on_init,
      settings = lua_settings,
    })

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        on_attach = M.on_attach,
        on_init = M.on_init,
        capabilities = M.capabilities,
      })
    end
  end
end

-- lsp diagnostic config
vim.diagnostic.config({
  virtual_text = true, -- enable ghost text nexto to the error line
  signs = false, -- disable error signs in the left side
  float = { border = "rounded" }, -- show rounded border for the lsp floating window
})

return M
