require("nvim-treesitter.configs").setup({
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "markdown", "markdown_inline" },
	--
	--     -- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	--
	--         -- Automatically install missing parsers when entering buffer
	--           -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
	--
	highlight = {
		enable = true,
		--
		additional_vim_regex_highlighting = false,
	},
	autopairs = {
		enable = true,
	},
	autotag = {
		enable = true,
		enable_rename = true,
		enable_close = true,
		enable_close_on_slash = false,
		filetypes = {
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"vue",
			"tsx",
			"jsx",
			"rescript",
			"xml",
			"php",
			"markdown",
			"astro",
			"glimmer",
			"handlebars",
			"hbs",
		},
	},
	indent = {
		enable = true,
	},
	tree_docs = { enable = true },
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension

		disable = { "c", "ruby" }, -- optional, list of language that will be disabled
		-- [options]
	},
})
