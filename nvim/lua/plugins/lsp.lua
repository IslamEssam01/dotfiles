return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			"lspconfig",
		},
	},
	{
		"nvimdev/lspsaga.nvim",
		name = "lspsaga",
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
			dependencies = { "lspsaga" },

			config = function()
				local lsp = require("lsp-zero")

				lsp.preset("recommended")

				local lsp_servers = require("utils.lsp_servers")

				local capabilities = require("cmp_nvim_lsp").default_capabilities()
				capabilities.textDocument.foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				}

				-- for folding in ufo plugin
				for _, ls in ipairs(lsp_servers) do
					if ls ~= "lua_ls" and ls ~= "tsserver" and ls ~= "jsonls" then
						require("lspconfig")[ls].setup({
							capabilities = capabilities,
						})
					end
					if ls == "lua_ls" then
						local lua_opts = lsp.nvim_lua_ls()
						lua_opts.capabilites = capabilities
						require("lspconfig").lua_ls.setup(lua_opts)
					end
					if ls == "tsserver" then
						local function organize_imports()
							local params = {
								command = "_typescript.organizeImports",
								arguments = { vim.api.nvim_buf_get_name(0) },
							}
							vim.lsp.buf.execute_command(params)
						end
						require("lspconfig").tsserver.setup({
							capabilities = capabilities,
							on_attach = function(client, bfnr)
								vim.api.nvim_create_user_command(
									"OrganizeImports",
									organize_imports,
									{ desc = "Organize Imports" }
								)
							end,
						})
					end

					if ls == "jsonls" then
						require("lspconfig").jsonls.setup({

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

				lsp.set_preferences({
					suggest_lsp_servers = false,
					sign_icons = {
						error = "E",
						warn = "W",
						hint = "H",
						info = "I",
					},
				})

				-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				-- 	silent = true,
				-- })

				lsp.on_attach(function(client, bufnr)
					local opts = { buffer = bufnr, remap = false }

					vim.keymap.set("n", "gd", "<cmd>:Lspsaga goto_definition<cr>", opts)
					vim.keymap.set("n", "gpd", "<cmd>:Lspsaga peek_definition<cr>", opts)
					vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
					vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
					vim.keymap.set("n", "go", "<cmd>:Lspsaga goto_type_definition<cr>", opts)
					vim.keymap.set("n", "gpf", "<cmd>:Lspsaga finder<cr>", opts)
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
									require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
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
									require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
								end,
								"Goto previous error",
							},
						},
					})

					vim.keymap.set("n", "<leader>vca", "<cmd>:Lspsaga code_action<cr>", opts)

					vim.keymap.set("n", "<leader>vrn", "<cmd>:Lspsaga rename<cr>", opts)
					vim.keymap.set("i", "<C-h>", function()
						vim.lsp.buf.signature_help()
					end, opts)
				end)

				lsp.setup()

				vim.diagnostic.config({
					virtual_text = true,
				})
			end,
		},
	},
}
