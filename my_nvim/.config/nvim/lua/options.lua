vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.backspace = "2"
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.opt.fillchars = { eob = " " }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"

vim.cmd([[ set noswapfile ]])
vim.cmd([[ set termguicolors ]])

--Line numbers
vim.wo.number = true

vim.opt.clipboard = "unnamedplus" -- use system clipboard

-- Start scrolling 5 rows before the top or bottom of the screen
vim.opt.scrolloff = 5

-- Add visual guides for columns ("80,120")
vim.opt.colorcolumn = "80"

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH

-- spelling
vim.opt.spelllang = "en_us"
vim.opt.spell = true
