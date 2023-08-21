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
	"freddiehaddad/feline.nvim",
	"AckslD/swenv.nvim",
	---------------- Detailed Config ----------------------
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
	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	"lewis6991/gitsigns.nvim",
	"f-person/git-blame.nvim",
	"ruifm/gitlinker.nvim",
	{
		"sindrets/diffview.nvim",
		config = function()
			require("diffview").setup({
				win_config = { -- See ':h diffview-config-win_config'
					position = "left",
					width = 40,
					win_opts = {},
				},
			})
		end,
	},
	"wintermute-cell/gitignore.nvim",

	-- Fuzzy Finder (files, lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				cond = vim.fn.executable("make") == 1,
			},
			{
				"nvim-telescope/telescope-file-browser.nvim",
				dependencies = {
					"nvim-telescope/telescope.nvim",
					"nvim-lua/plenary.nvim",
				},
			},
			"nvim-telescope/telescope-project.nvim",
			"cljoly/telescope-repo.nvim",
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
			config = function()
				require("telescope").load_extension("live_grep_args")
			end,
			{
				"ahmedkhalf/project.nvim",
				config = function()
					require("project_nvim").setup({})
				end,
			},
			{
				"nvim-telescope/telescope-symbols.nvim",
				dependencies = { "nvim-telescope/telescope-file-browser.nvim" },
			},
		},
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		dependencies = { "kkharji/sqlite.lua" },
	},
	{ -- Directory Management
		{
			"stevearc/oil.nvim",
			opts = {},
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
	},
	-- Git related plugins
	{
		"tpope/vim-fugitive",
		"tpope/vim-rhubarb",
		"lewis6991/gitsigns.nvim",
		"f-person/git-blame.nvim",
		"ruifm/gitlinker.nvim",
		"wintermute-cell/gitignore.nvim",
		{
			"sindrets/diffview.nvim",
			config = function()
				require("diffview").setup({
					win_config = { -- See ':h diffview-config-win_config'
						position = "left",
						width = 40,
						win_opts = {},
					},
				})
			end,
		},
	},
	{ -- Terminal Plugin

		{
			"kiyoon/jupynium.nvim",
			build = "pip3 install --user .",
		},
		{
			"akinsho/toggleterm.nvim",
			keys = { [[<C-\>]] },
			cmd = { "ToggleTerm", "TermExec" },
			module = { "toggleterm", "toggleterm.terminal" },
			config = function()
				require("core.plugin_config.Terminal.toggleterm").setup()
			end,
		},

		{
			"jpalardy/vim-slime",
			config = function()
				vim.g.slime_target = "tmux"
				vim.g.slime_default_config = {
					socket_name = "default",
					target_pane = "{last}",
				}
			end,
		},

		{
			"ThePrimeagen/harpoon",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
	},
}
local opts = {}
require("lazy").setup(plugins, opts)
