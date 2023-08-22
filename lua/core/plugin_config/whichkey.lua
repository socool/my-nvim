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

local mappings = {
	-- ใช้งานโดย พิมพ์ <leader> + g + <Command>
	-- เช่น space + g + t => 'ดู git_status'
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
