-- Navigate vim panes better
-- Set <space> as the leader key
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
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

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "oil://*" },
	callback = function()
		vim.keymap.set("n", "q", "<cmd>lua require('oil').close()<cr>", { buffer = 0 })
	end,
})
