require("lazy").setup({
  "neovim/nvim-lspconfig",
  "nvim-tree/nvim-tree.lua",
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
      },
    },
  },
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
}
})
