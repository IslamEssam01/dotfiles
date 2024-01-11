return {
	{

		"JoosepAlviste/nvim-ts-context-commentstring",
		depnendencies = {
			"echasnovski/mini.comment",
		},
	},
	{
		"echasnovski/mini.comment",
		version = false,
		config = function()
			require("ts_context_commentstring").setup({

				enable_autocmd = false,
			})

			require("mini.comment").setup({
				options = {
					custom_commentstring = function()
						return require("ts_context_commentstring").calculate_commentstring() or vim.bo.commentstring
					end,
				},
			})

			vim.g.skip_ts_context_commentstring_module = true
		end,
	},
}
