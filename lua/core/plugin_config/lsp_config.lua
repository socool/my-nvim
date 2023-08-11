local on_attach = function(_, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	nmap("<leader><C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, { desc = "Format current buffer with LSP" })
end

local servers = {
	sumneko_lua = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
	html = {},
	jsonls = {
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
			},
		},
	},
	pyright = {},
	rust_analyzer = {},
	marksman = {},
	zk = {},
}

-- Setup neovim lua configuration
require("neodev").setup()
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require("mason").setup({
	opts = {
		ensure_installed = {
			"black",
			"debugpy",
			"ruff",
			"isort",
			"hadolint",
		},
	},
})

-- Ensure the servers above are installed
local mason_lspconfig = require("mason-lspconfig")

require("mason-lspconfig").setup({
	ensure_installed = {
		"ruff_lsp",
		"jedi_language_server",
	},
})

mason_lspconfig.setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
		})
	end,
})

-- Turn on lsp status information
require("fidget").setup()

require("illuminate").configure({
	filetypes_denylist = {
		"dirvish",
		"fugitive",
		"aerial",
	},
})

-- change the highlight style
vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

--- auto update the highlight style on colorscheme change
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
	pattern = { "*" },
	callback = function(ev)
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
	end,
})

vim.cmd([[IlluminatePause]])
vim.keymap.set("n", "<leader>iis", ":IlluminateResume<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>iih", ":IlluminatePause<CR>", { noremap = true, silent = true })
