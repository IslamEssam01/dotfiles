return {
	{
		"nvim-lualine/lualine.nvim",

		config = function()
			require("lualine").setup({
				options = {
					theme = "tokyonight",
					component_separators = { left = "", right = "|" },
					section_separators = { left = "", right = "" },
				},
				extensions = { "nvim-tree", "nvim-dap-ui", "toggleterm", "trouble", "mason", "lazy" },
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						"branch",
						"diff",
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							symbols = { error = " ", warn = " ", info = " ", hint = " " },
						},
					},
					lualine_c = { "filename" },
					lualine_x = { { "copilot", show_colors = true }, "encoding", "fileformat", "filetype" }, -- I added copilot here
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	},
	{ "AndreM222/copilot-lualine" },
}
