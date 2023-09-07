local whichkey = require("which-key")
local conf = {
	window = {
		border = "single",
		position = "bottom",
	},
	triggers = { "<leader>" },
	triggers_nowait = {
		-- marks
		"~",
		"`",
	},
	plugins = {
		presets = {
			g = true,
		},
	},
}

local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = false,
}

vim.api.nvim_set_keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", { noremap = true, desc = "BufferLineCyclePrev" })
vim.api.nvim_set_keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", { noremap = true, desc = "BufferLineCycleNext" })
vim.api.nvim_set_keymap("n", "<S-c>", ":BufferLinePickClose<CR>", { noremap = true, desc = "BufferLinePickCose" })

local mappings = {
	-- ใช้งานโดย พิมพ์ <leader> + g + <Command>
	-- เช่น space + g + t => 'ดู git_status'
	["<Tab>"] = { "<cmd>BufferLineMoveNext<cr>", "BufferLineMoveNext" },
	["<S-Tab>"] = { "<cmd>BufferLineMovePrev<cr>", "BufferLineMovePrev" },
	C = {
		name = "ChatGPT",
		c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
		e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction" },
		g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction" },
		t = { "<cmd>ChatGPTRun translate<CR>", "Translate" },
		k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords" },
		d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring" },
		A = { "<cmd>ChatGPTActAs<CR>", "Act As" },
		a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests" },
		o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code" },
		s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize" },
		f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs" },
		x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code" },
		r = { "<cmd>ChatGPTRun roxygen_edit<CR>", "Roxygen Edit" },
		l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis" },
	},
	g = {
		Y = { "<cmd>lua require('gitlinker').get_repo_url()<cr>", "Gitlinker Get Repo URL" },
		y = {
			"<cmd>lua require('gitlinker').get_buf_range_url('v', {action_callback = require('gitlinker.actions').copy_to_clipboard, print_url = true})<cr>",
			"Gitlinker Copy URL with Rank",
			mode = "v",
		},

		B = {
			"<cmd>lua require('gitlinker').get_repo_url({action_callback = require('gitlinker').actions.open_in_browser})<cr>",
			"Gitlinker Open Repo URL with Browser (Main URL)",
		},
		b = {
			"<cmd>lua require('gitlinker').get_buf_range_url('v', {action_callback = require('gitlinker.actions').open_in_browser})<cr>",
			"Git Open Repo with File",
			mode = "v",
		},
		d = { "<cmd>DiffviewOpen<cr>", "DiffviewOpen" },
		D = { "<cmd>DiffviewClose<cr>", "DiffviewClose" },
		t = { "<cmd>GitToggle<cr>", "Git Status" },
	},
	m = {
		name = "Minimap",
		o = { "<cmd>lua require('mini.map').open()<cr>", "Minimap Open" },
		c = { "<cmd>lua require('mini.map').close()<cr>", "Minimap Close" },
		f = { "<cmd>lua require('mini.map').toggle_focus()<cr>", "Minimap Focus" },
	},
	o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
	b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
	d = {
		"<cmd>Gitsigns diffthis HEAD<cr>",
		"Diff",
	},
}

whichkey.setup(conf)
whichkey.register(mappings, opts)
