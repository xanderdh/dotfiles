local M = {}

local install_languages = {
  "css",
  "html",
  "lua",
  "luadoc",
  "markdown",
  "markdown_inline",
  "printf",
  "python",
  "toml",
  "vim",
  "vimdoc",
  "yaml",
}

local indent_filetypes = {
  lua = true,
  python = true,
  vim = true,
}

local function set_indentexpr(bufnr)
  vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

local function reload_treesitter()
  for module_name in pairs(package.loaded) do
    if module_name == "nvim-treesitter" or module_name:match("^nvim%-treesitter%.") then
      package.loaded[module_name] = nil
    end
  end

  return require("nvim-treesitter")
end

function M.install()
  reload_treesitter().install(install_languages, { summary = true }):wait(300000)
end

function M.setup()
  require("nvim-treesitter").setup()
  vim.treesitter.language.register("vimdoc", "help")

  local group = vim.api.nvim_create_augroup("user-treesitter", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { "help", "lua", "python", "vim" },
    callback = function(event)
      vim.treesitter.start(event.buf)

      if indent_filetypes[vim.bo[event.buf].filetype] then
        set_indentexpr(event.buf)
      end
    end,
  })
end

return M
