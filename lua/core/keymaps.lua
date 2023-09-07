-- Navigate vim panes better
-- Set <space> as the leader key

vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
-- vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "<leader>ddh", vim.diagnostic.hide)
vim.keymap.set("n", "<leader>dds", vim.diagnostic.show)

vim.keymap.set("n", "<leader>w", ":wa<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", ":qa!<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })

-- nomodoro keymap
vim.keymap.set("n", "<leader>nw", "<cmd>NomoWork<cr>")
vim.keymap.set("n", "<leader>nb", "<cmd>NomoBreak<cr>")
vim.keymap.set("n", "<leader>ns", "<cmd>NomoStop<cr>")

-- bufdelete
vim.keymap.set("n", "bd", ":bdelete<cr>")

-- codeium
-- <A> -> map to alt key in iTerm2 -> Settings -> Profiles -> Keys -> Left Option Key: Esc+
vim.keymap.set("i", "<A-m>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true, desc = "Codeium Accept" })
vim.keymap.set("i", "<A-f>", function()
	return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true, desc = "Codeium Cycle Next" })
vim.keymap.set("i", "<A-n>", function()
	return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true, desc = "Codeium Cycle Prev" })
vim.keymap.set("i", "<A-x>", function()
	return vim.fn["codeium#Clear"]()
end, { expr = true, desc = "Codedium Clear" })
vim.keymap.set("i", "<A-s>", function()
	return vim.fn["codeium#Complete"]()
end, { expr = true, desc = "Codedum Complete" })
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "oil://*" },
	callback = function()
		vim.keymap.set("n", "q", "<cmd>lua require('oil').close()<cr>", { buffer = 0 })
	end,
})
