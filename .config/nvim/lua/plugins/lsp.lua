return {
	{
		"nvimdev/lspsaga.nvim",
		name = "lspsaga",
		dependencies = { "lspconfig" },
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = {
					enable = false,
				},
				lightbulb = {
					enable = true,
					sign = false,
				},
			})
		end,
	},
	{
		{
			"neovim/nvim-lspconfig",
			name = "lspconfig",
			dependencies = { "hrsh7th/cmp-nvim-lsp" },
			config = function()
				local function lspSymbol(name, icon)
					vim.fn.sign_define("DiagnosticSign" .. name, { text = icon, numhl = "DiagnosticDefault" .. name })
				end
				lspSymbol("Error", " ")
				lspSymbol("Hint", "")
				lspSymbol("Info", " ")
				lspSymbol("Warn", " ")
				local lsp_servers = require("utils.lsp_servers")

				local capabilities = require("cmp_nvim_lsp").default_capabilities()
				capabilities.textDocument.foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				}

				-- for folding in ufo plugin
				for _, ls in ipairs(lsp_servers) do
					if ls ~= "lua_ls" and ls ~= "tsserver" and ls ~= "jsonls" and ls ~= "tailwindcss" then
						require("lspconfig")[ls].setup({
							capabilities = capabilities,
						})
					end
					if ls == "tailwindcss" then
						require("lspconfig").tailwindcss.setup({
							capabilities = capabilities,
						})
					end
					if ls == "lua_ls" then
						require("lspconfig").lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									runtime = {
										version = "LuaJIT",
									},
									diagnostics = {
										globals = { "vim" },
									},
									workspace = {
										library = {
											vim.env.VIMRUNTIME,
										},
									},
								},
							},
						})
					end

					if ls == "jsonls" then
						require("lspconfig").jsonls.setup({

							capabilities = capabilities,
							filetypes = { "json", "jsonc" },
							settings = {
								json = {
									-- Schemas https://www.schemastore.org
									schemas = {
										{
											fileMatch = { "package.json" },
											url = "https://json.schemastore.org/package.json",
										},
										{
											fileMatch = { "jsconfig*.json" },
											url = "https://json.schemastore.org/jsconfig.json",
										},
										{
											fileMatch = { "tsconfig*.json" },
											url = "https://json.schemastore.org/tsconfig.json",
										},
										{
											fileMatch = {
												".prettierrc",
												".prettierrc.json",
												"prettier.config.json",
											},
											url = "https://json.schemastore.org/prettierrc.json",
										},
										{
											fileMatch = { ".eslintrc", ".eslintrc.json" },
											url = "https://json.schemastore.org/eslintrc.json",
										},
										{
											fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
											url = "https://json.schemastore.org/babelrc.json",
										},
										{
											fileMatch = { "lerna.json" },
											url = "https://json.schemastore.org/lerna.json",
										},
										{
											fileMatch = { "now.json", "vercel.json" },
											url = "https://json.schemastore.org/now.json",
										},
										{
											fileMatch = {
												".stylelintrc",
												".stylelintrc.json",
												"stylelint.config.json",
											},
											url = "http://json.schemastore.org/stylelintrc.json",
										},
									},
								},
							},
						})
					end
				end

				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
					border = "rounded",
				})

				vim.api.nvim_create_autocmd("LspAttach", {
					desc = "LSP actions",
					callback = function(event)
						local opts = { buffer = event.buf, remap = false }

						-- these will be buffer-local keybindings
						-- because they only work if you have an active language server

						vim.keymap.set("n", "gd", "<cmd>:Lspsaga goto_definition<cr>", opts)
						vim.keymap.set("n", "gpd", "<cmd>:Lspsaga peek_definition<cr>", opts)
						vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
						vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
						vim.keymap.set("n", "go", "<cmd>:Lspsaga goto_type_definition<cr>", opts)
						vim.keymap.set("n", "gpf", "<cmd>:Lspsaga finder<cr>", opts)
						vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
						vim.keymap.set("n", "<leader>a", "<cmd>:Lspsaga outline<cr>")
						vim.keymap.set("n", "<leader>vws", function()
							vim.lsp.buf.workspace_symbol()
						end, opts)
						vim.keymap.set("n", "<leader>vd", function()
							vim.diagnostic.open_float()
						end, opts)

						require("which-key").register({
							["]"] = {
								name = "Goto next",
								d = { "<cmd> Lspsaga diagnostic_jump_next <CR>", "Goto next diagnostic" },
								e = {
									function()
										require("lspsaga.diagnostic"):goto_next({
											severity = vim.diagnostic.severity.ERROR,
										})
									end,
									"Goto next error",
								},
							},
						})

						require("which-key").register({
							["["] = {
								name = "Goto previous",
								d = { "<cmd> Lspsaga diagnostic_jump_prev <CR>", "Goto previous diagnostic" },
								e = {
									function()
										require("lspsaga.diagnostic"):goto_prev({
											severity = vim.diagnostic.severity.ERROR,
										})
									end,
									"Goto previous error",
								},
							},
						})

						vim.keymap.set({ "n", "v" }, "<leader>vca", "<cmd>:Lspsaga code_action<cr>", opts)

						vim.keymap.set("n", "<leader>vrn", "<cmd>:Lspsaga rename<cr>", opts)
						-- vim.keymap.set("i", "<C-h>", function()
						-- 	vim.lsp.buf.signature_help()
						-- end, opts)
					end,
				})

				vim.diagnostic.config({
					virtual_text = true,
				})
			end,
		},
	},
}
