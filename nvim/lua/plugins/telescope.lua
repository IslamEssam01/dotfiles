return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                              , branch = '0.1.x',
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "debugloop/telescope-undo.nvim" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			{ "JoseConseco/telescope_sessions_picker.nvim" },
		},

		config = function()
			require("telescope").setup({
				extensions = {
					undo = { use_delta = true },

					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
					sessions_picker = {
						sessions_dir = vim.fn.stdpath("data") .. "/session/", -- same as '/home/user/.local/share/nvim/session'
					},
				},
				defaults = {
					file_ignore_patterns = {
						"node_modules",
					},
				},
			})
			require("telescope").load_extension("fzf")

			require("telescope").load_extension("file_browser")

			require("telescope").load_extension("undo")

			require("telescope").load_extension("sessions_picker")
		end,
	},
}
