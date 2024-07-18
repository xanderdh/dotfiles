require "nvchad.options"
local nvim_tree = require "nvchad.configs.nvimtree"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
--
--
vim.opt.spelllang = "en_us"
vim.opt.spell = true

nvim_tree.view.width = 40
