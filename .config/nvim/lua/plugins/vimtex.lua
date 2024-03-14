return {
	"lervag/vimtex",
	init = function()
		-- put vim.g.vimtex_* settings here
		-- vim.g.vimtex_syntax_enabled = 0
		-- vim.g.vimtex_compiler_latexmk = { }
		vim.g.vimtex_view_method = "zathura"
        vim.g.tex_flavor="latex"
        vim.g.tex_conceal="abdmg"
		-- vim.g.vimtex_compiler_method = "latexrun"
	end,
}
