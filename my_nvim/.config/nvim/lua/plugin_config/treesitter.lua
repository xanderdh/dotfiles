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

local warned = {}

local function set_indentexpr(bufnr)
  vim.bo[bufnr].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

local function warn_once(key, message)
  if warned[key] then
    return
  end

  warned[key] = true
  vim.notify(message, vim.log.levels.WARN, { title = "nvim-treesitter" })
end

local function reload_treesitter()
  for module_name in pairs(package.loaded) do
    if module_name == "nvim-treesitter" or module_name:match("^nvim%-treesitter%.") then
      package.loaded[module_name] = nil
    end
  end

  return require("nvim-treesitter")
end

local function get_lang(bufnr)
  local filetype = vim.bo[bufnr].filetype
  return filetype, vim.treesitter.language.get_lang(filetype) or filetype
end

local function has_parser(lang)
  return #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", true) > 0
end

function M.install()
  if vim.fn.executable("tree-sitter") ~= 1 then
    warn_once(
      "missing-tree-sitter-cli",
      "tree-sitter CLI is not available in PATH; skipping parser installation. Install tree-sitter-cli and rerun :Lazy sync nvim-treesitter."
    )
    return false
  end

  reload_treesitter().install(install_languages, { summary = true }):wait(300000)
  return true
end

function M.enable(bufnr)
  local filetype, lang = get_lang(bufnr)

  if not has_parser(lang) then
    warn_once(
      "missing-parser:" .. lang,
      string.format(
        "No Tree-sitter parser is available for %s; skipping Tree-sitter features for this filetype. Install tree-sitter-cli and rerun :Lazy sync nvim-treesitter or :TSInstall %s.",
        filetype,
        lang
      )
    )
    return false
  end

  local ok, err = pcall(vim.treesitter.start, bufnr)
  if not ok then
    warn_once(
      "failed-start:" .. lang,
      string.format("Failed to start Tree-sitter for %s: %s", filetype, err)
    )
    return false
  end

  if indent_filetypes[filetype] then
    set_indentexpr(bufnr)
  end

  return true
end

function M.setup()
  require("nvim-treesitter").setup()
  vim.treesitter.language.register("vimdoc", "help")

  local group = vim.api.nvim_create_augroup("user-treesitter", { clear = true })

  vim.api.nvim_create_autocmd("FileType", {
    group = group,
    pattern = { "help", "lua", "python", "vim" },
    callback = function(event)
      M.enable(event.buf)
    end,
  })
end

return M
