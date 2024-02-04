return {
	"pmizio/typescript-tools.nvim",
	dependencies = { "nvim-lua/plenary.nvim", "lspconfig", "hrsh7th/cmp-nvim-lsp" },
	opts = {},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}
		require("typescript-tools").setup({
			capabilities = capabilities,
			settings = { publish_diagnostic_on = "change" },
		})
	end,
}
