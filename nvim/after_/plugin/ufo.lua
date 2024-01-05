--[[ vim.o.foldcolumn = "1" -- '0' is not bad
vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true

local ufo = require("ufo")
require("which-key").register({
	z = {
		name = "folding",
		R = { ufo.openAllFolds, "open all folds" },
		M = { ufo.closeAllFolds, "close all folds" },
		K = {

			function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end,
			"peek fold under cursor",
		},
	},
})

ufo.setup({
	provider_selector = function(bufnr, filetype, buftype)
		if filetype == "norg" then
			return { "treesitter", "indent" }
		else
			return { "lsp", "indent" }
		end
	end,
}) ]]
