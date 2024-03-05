return {

	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatter = {
				prettierd = {
					env = {
						PRETTIERD_DEFAULT_CONFIG = vim.fn.expand("~/.config/nvim/lua/utils/linter-config/.prettierrc"),
					},
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascriptreact = { "prettierd" },
				javascript = { "prettierd" },
				typescript = { "prettierd" },
			},
		})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ timeout_ms = 3000, bufnr = args.buf, lsp_fallback = true })
			end,
		})
	end,
}
