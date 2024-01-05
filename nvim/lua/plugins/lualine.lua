return {
	"nvim-lualine/lualine.nvim",

	config = function()
		require("lualine").setup({
			options = {
				theme = "tokyonight",
				component_separators = { left = "", right = "|" },
				section_separators = { left = "", right = "" },
			},
			extensions = { "nvim-tree", "nvim-dap-ui", "toggleterm", "trouble", "mason", "lazy" },
		})
	end,
}
