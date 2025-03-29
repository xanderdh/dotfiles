require("lazy").setup({

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugin_config.lsp-config")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("plugin_config.nvim-tree")
		end,
	},

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
	},

	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- format on save
		config = function()
			require("plugin_config.conform")
		end,
	},
})
