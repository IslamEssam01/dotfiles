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
		smart_open = {
			show_scores = false,
			ignore_patterns = { "*.git/*", "*/tmp/*" },
			match_algorithm = "fzf",
			disable_devicons = false,
			open_buffer_indicators = { previous = "👀", others = "🙈" },
		},
	},
})
require("telescope").load_extension("fzf")

require("telescope").load_extension("file_browser")

require("telescope").load_extension("undo")

require("telescope").load_extension("sessions_picker")
require("telescope").load_extension("smart_open")
