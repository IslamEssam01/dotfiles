return {
	"kevinhwang91/nvim-ufo",
    name="ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		{
			"luukvbaal/statuscol.nvim",
			config = function()
				local builtin = require("statuscol.builtin")
				require("statuscol").setup({
					relculright = true,
					segments = {
						{ text = { builtin.foldfunc }, click = "v:lua.ScFa" },
						{ text = { "%s" }, click = "v:lua.ScSa" },
						{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
					},
				})
			end,
		},
	},
	config = function()
		vim.o.foldcolumn = "1" -- '0' is not bad
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
		})
	end,
}
