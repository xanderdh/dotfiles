require("lazy").setup({
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugin_config.lsp-config")
		end,
	},

	"nvim-tree/nvim-web-devicons",

	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("plugin_config.nvim-tree")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc" },
			indent = { enable = true },
			highlight = {
				enable = true,
				use_languagetree = true,
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
