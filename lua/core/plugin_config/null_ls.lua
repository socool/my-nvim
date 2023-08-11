local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
local nls_utils = require("null-ls.utils")
local with_diagnostics_code = function(builtin)
	return builtin.with({
		diagnostics_format = "#{m} [#{c}]",
	})
end

local with_root_file = function(builtin, file)
	return builtin.with({
		condition = function(utils)
			return utils.root_has_file(file)
		end,
	})
end

null_ls.setup({
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
	sources = {
		null_ls.builtins.diagnostics.ruff,
		null_ls.builtins.diagnostics.write_good,
		null_ls.builtins.diagnostics.tsc,
		null_ls.builtins.diagnostics.shellcheck,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.fixjson,
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.shfmt,

		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.code_actions.gitrebase,

		-- hover
		null_ls.builtins.hover.dictionary,
	},
	debounce = 150,
	save_after_format = false,
	root_dir = nls_utils.root_pattern(".git"),
})

vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { remap = false })
