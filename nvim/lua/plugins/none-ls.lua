return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	config = function()
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		local null_ls = require("null-ls")

		local opts = {
			sources = {
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.stylua,
			},

			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_buf_set_keymap(
						bufnr,
						"n",
						"<leader>f",
						"<cmd> lua  vim.lsp.buf.format({ bufnr = bufnr ,timeout_ms = 2000 }) <CR>",
						{ desc = "format file" }
					)

					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr, timeout_ms = 2000 })
						end,
					})
				end
			end,
		}

		null_ls.setup(opts)
	end,
}
