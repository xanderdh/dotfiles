local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("options")
require("plugins")
require("keymaps")

-- TODO: refactor below

-- catppuccin setup
require("catppuccin").setup({
  flavour = "mocha",
  transparent_background = true,

  highlight_overrides = {
    mocha = function(colors)
      return {
        CursorLine = { bg = colors.surface0 }, -- Use a predefined Catppuccin color
      }
    end,
  },

  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    integrations = {
      treesitter = true,
      cmp = true,
      gitsigns = true,
      nvimtree = true,
    },
  },
})

vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd.colorscheme("catppuccin")

-- gitsigns setup
require("gitsigns").setup()
