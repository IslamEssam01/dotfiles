return {

	"williamboman/mason.nvim",
	dependencies = {

		{ "williamboman/mason-lspconfig.nvim" },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
	},
	config = function()
		require("mason").setup({})
		local lsp_servers = require("utils.lsp_servers")

		require("mason-tool-installer").setup({
			ensure_installed = {
				"js-debug-adapter",
				"stylua",
				"prettierd",
				unpack(lsp_servers),
			},
			auto_update = true,
			run_on_start = true,
			start_delay = 3000, -- 3 second delay
			-- debounce_hours = 5, -- at least 5 hours between attempts to install/update
		})
	end,
}
