local lsp = require("lsp-zero")

lsp.preset("recommended")

local lsp_servers = {
	"tsserver",
	"eslint",
	"lua_ls",
	"emmet_language_server",
	"cssls",
	"cssmodules_ls",
	"html",
	"prismals",
	"pyright",
	"jsonls",
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}

require("mason").setup({})

local lsp_config = {
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = lsp_servers,
	handlers = {
		lsp.default_setup,
	},
}

-- for folding in ufo plugin
for _, ls in ipairs(lsp_servers) do
	if ls ~= "lua_ls" and ls ~= "tsserver" and ls ~= "jsonls" then
		lsp_config.handlers[ls] = function()
			require("lspconfig")[ls].setup({
				capabilities = capabilities,
			})
		end
	end
	if ls == "lua_ls" then
		lsp_config.handlers.lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			lua_opts.capabilites = capabilities
			require("lspconfig").lua_ls.setup(lua_opts)
		end
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
				vim.api.nvim_create_user_command("OrganizeImports", organize_imports, { desc = "Organize Imports" })
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
require("mason-lspconfig").setup(lsp_config)

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

	--[[ vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts) ]]
	vim.keymap.set("n", "gd", "<cmd>:Lspsaga goto_definition<cr>", opts)
	vim.keymap.set("n", "gpd", "<cmd>:Lspsaga peek_definition<cr>", opts)
	-- vim.keymap.set("n", "K", function()
	-- 	vim.lsp.buf.hover()
	-- end, opts)
	vim.keymap.set("n", "K", "<cmd>:Lspsaga hover_doc<cr>", opts)
	vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
	vim.keymap.set("n", "go", "<cmd>:Lspsaga goto_type_definition<cr>", opts)
	vim.keymap.set("n", "gpf", "<cmd>:Lspsaga finder<cr>", opts)
	--[[ vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts) ]]
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	--[[ vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts) ]]
	vim.keymap.set("n", "]d", "<cmd>:Lspsaga diagnostic_jump_next<cr>", opts)
	--[[ vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts) ]]
	vim.keymap.set("n", "[d", "<cmd>:Lspsaga diagnostic_jump_prev<cr>", opts)
    
	--[[ vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts) ]]
	vim.keymap.set("n", "<leader>vca", "<cmd>:Lspsaga code_action<cr>", opts)

	--[[ vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts) ]]
	--[[ vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts) ]]
	vim.keymap.set("n", "<leader>vrn", "<cmd>:Lspsaga rename<cr>", opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
