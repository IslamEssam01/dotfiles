local builtin = require("telescope.builtin")

-- vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "find files using telescope" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "find git files using telescope" })
vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = "get diagnostics from lsp in telescope" })
vim.keymap.set("n", "<leader>ps", builtin.current_buffer_fuzzy_find, { desc = "fuzzy find in buffer using telescope" })
vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "find buffers using telescope" })
vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "live grep using telescope" })
vim.keymap.set(
	"n",
	"<leader>pp",
	require("telescope").extensions.sessions_picker.sessions_picker,
	{ desc = "pick session" }
)
vim.keymap.set("n", "<leader>pf", function()
	require("telescope").extensions.smart_open.smart_open({ cwd_only = true, filename_first = true })
end, { desc = "find files using smart open", noremap = true, silent = true })

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
