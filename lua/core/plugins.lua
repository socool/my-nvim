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
	-- Navigate
	{
		"phaazon/hop.nvim",
		dependencies = {
			"ziontee113/syntax-tree-surfer",
			"mfussenegger/nvim-treehopper",
		},
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"nvim-treesitter/playground",
		{
			"RRethy/nvim-treesitter-endwise",
			event = "InsertEnter",
		},
		{
			"m-demare/hlargs.nvim",
			config = function()
				require("hlargs").setup()
			end,
		},
	},
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		"nvim-telescope/telescope-project.nvim",
		"nvim-telescope/telescope-media-files.nvim",
		"cljoly/telescope-repo.nvim",
		"stevearc/aerial.nvim",
		"gbprod/yanky.nvim",
		"kevinhwang91/nvim-bqf",
		"chrisbra/unicode.vim",
		{
			"folke/trouble.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
		{
			"nvim-telescope/telescope-symbols.nvim",
			dependencies = { "nvim-telescope/telescope-file-browser.nvim" },
		},
	},
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({})
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"nvim-telescope/telescope-frecency.nvim",
		config = function()
			require("telescope").load_extension("frecency")
		end,
		dependencies = { "kkharji/sqlite.lua" },
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		cond = vim.fn.executable("make") == 1,
	},
	{
		"nvim-telescope/telescope-live-grep-args.nvim",
		config = function()
			require("telescope").load_extension("live_grep_args")
		end,
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("telescope").setup()
	end,
	{ -- BCE
		"karb94/neoscroll.nvim",
		"lukas-reineke/indent-blankline.nvim",
		"nyngwang/NeoZoom.lua",
		"AckslD/swenv.nvim",
		"vim-scripts/Tabmerge",

		{
			"windwp/nvim-spectre",
			config = function()
				require("spectre").setup()
			end,
		},
		{
			"akinsho/bufferline.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons", "famiu/bufdelete.nvim", "famiu/bufdelete.nvim" },
			config = function()
				require("bufferline").setup()
			end,
		},
		{
			"gelguy/wilder.nvim",
			build = ":UpdateRemotePlugins",
			dependencies = {
				"roxma/nvim-yarp",
				"roxma/vim-hug-neovim-rpc",
				"nixprime/cpsm",
				"romgrk/fzy-lua-native",
				"sharkdp/fd",
			},
		},
		{
			"echasnovski/mini.map",
			branch = "stable",
			event = "BufWinEnter",
			dependencies = { "dstein64/nvim-scrollview", enabled = false },
		},

		{
			"anuvyklack/windows.nvim",
			dependencies = {
				"anuvyklack/middleclass",
				"anuvyklack/animation.nvim",
			},
		},
		{
			"gen740/SmoothCursor.nvim",
			config = function()
				require("smoothcursor").setup()
			end,
		},
		{
			"kevinhwang91/nvim-ufo",
			dependencies = { "kevinhwang91/promise-async" },
		},
	},
	"catppuccin/nvim",
	{ "dbinagi/nomodoro", config = true },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			opt = true,
			config = function()
				require("lualine").setup({
					sections = {
						lualine_x = {
							require("nomodoro").status,
						},
					},
				})
			end,
		},
	},
	{ -- AI
		{
			"Exafunction/codeium.vim",
			event = "InsertEnter",
		},
		{
			"jackMort/ChatGPT.nvim",
			dependencies = {
				"MunifTanjim/nui.nvim",
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope.nvim",
			},
		},
	},
	{ -- Coding
		{
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		},
	},
	{ -- Interface
		{
			"goolord/alpha-nvim",
			event = "VimEnter",
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
		{
			"petertriho/nvim-scrollbar",
			dependencies = {
				"kevinhwang91/nvim-hlslens",
				"folke/tokyonight.nvim",
				lazy = false,
				priority = 1000,
				opts = {},
			},
		},
	},
}
local opts = {}
require("lazy").setup(plugins, opts)
