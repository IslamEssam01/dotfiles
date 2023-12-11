local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "find files using telescope" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "find git files using telescope" })
vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = "get diagnostics from lsp in telescope" })
vim.keymap.set("n", "<leader>ps", builtin.current_buffer_fuzzy_find, { desc = "fuzzy find in buffer using telescope" })
vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "find buffers using telescope" })
vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "live grep using telescope" })
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
	},
})
require("telescope").load_extension("fzf")

require("telescope").load_extension("file_browser")

require("telescope").load_extension("undo")
