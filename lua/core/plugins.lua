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

local plugins = {
	"folke/which-key.nvim",
	"MunifTanjim/nui.nvim",
	"nvim-lua/plenary.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		{ -- LSP Configuration & Plugins
			"neovim/nvim-lspconfig",
			dependencies = {
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				"folke/neodev.nvim",
				{ "j-hui/fidget.nvim", tag = "legacy" },
				"b0o/schemastore.nvim",
				"RRethy/vim-illuminate",
			},
		},
		{ -- Autocompletion
			"hrsh7th/nvim-cmp",
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"L3MON4D3/LuaSnip",
				"saadparwaiz1/cmp_luasnip",
				"rafamadriz/friendly-snippets",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
				"hrsh7th/cmp-nvim-lua",
			},
		},

		{
			"VonHeikemen/lsp-zero.nvim",
			config = function()
				local lsp = require("lsp-zero")
				lsp.preset("recommended")
				lsp.setup()
				lsp.nvim_workspace()
			end,
		},
		{
			"utilyre/barbecue.nvim",
			event = "VeryLazy",
			dependencies = {
				"neovim/nvim-lspconfig",
				"SmiteshP/nvim-navic",
				"nvim-tree/nvim-web-devicons",
			},
			config = true,
		},
	},
}
local opts = {}
require("lazy").setup(plugins, opts)
