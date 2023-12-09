local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "find files using telescope" })
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "find git files using telescope" })
vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = "get diagnostics from lsp in telescope" })
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "find files including grep word using telepscope" })
vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "find buffers using telescope" })
vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "live grep using telescope" })
require("telescope").load_extension("file_browser")

require("telescope").load_extension("undo")
require("telescope").setup({
	extensions = {
		undo = { use_delta = true },
	},
})
