local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"nvim-telescope/telescope-file-browser.nvim",

	"navarasu/onedark.nvim",
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},

	{ "nvim-treesitter/nvim-treesitter-context" },
	{
		"mbbill/undotree",
		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
	{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },

	-- LSP Support
	{
		"neovim/nvim-lspconfig",
		dependencies = { "nvimdev/lspsaga.nvim" },
	},
	-- Autocompletion
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{ "hrsh7th/cmp-path" },
	{ "onsails/lspkind-nvim" },
	{ "saadparwaiz1/cmp_luasnip", dependencies = { "rafamadriz/friendly-snippets" } },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-cmdline" },
	{ "hrsh7th/cmp-nvim-lua" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			fast_wrap = {},
		}, -- this is equalent to setup({}) function
	},

	"windwp/nvim-ts-autotag",
	"nvim-tree/nvim-web-devicons",
	"nvim-lualine/lualine.nvim",
	"christoomey/vim-tmux-navigator",
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"lewis6991/gitsigns.nvim",
	"nvim-tree/nvim-tree.lua",
	"moll/vim-bbye",
	"HiPhish/rainbow-delimiters.nvim",
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
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
	},
	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"debugloop/telescope-undo.nvim",
	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},
	{
		"roobert/surround-ui.nvim",
		dependencies = {
			"kylechui/nvim-surround",
			"folke/which-key.nvim",
		},
		config = function()
			require("surround-ui").setup({
				root_key = "S",
			})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	"f-person/git-blame.nvim",

	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-tree.lua",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
		-- Uncomment next line if you want to follow only stable versions
		-- version = "*"
	},
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	{
		"https://git.sr.ht/~havi/telescope-toggleterm.nvim",
		event = "TermOpen",
		config = function()
			require("telescope").load_extension("toggleterm")
		end,
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	}, -- lazy.nvim
	{
		"kawre/leetcode.nvim",
		build = ":TSUpdate html",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim", -- required by telescope
			"MunifTanjim/nui.nvim",
		},
		opts = {
			-- configuration goes here
		},
	},
	{ "ThePrimeagen/vim-be-good" },
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "mfussenegger/nvim-dap" },
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			require("dapui").setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
	{
		"andymass/vim-matchup",
		config = function()
			vim.g.matchup_matchparen_enabled = 0
		end,
	},
	-- {
	-- 	"ray-x/lsp_signature.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {},
	-- 	config = function()
	-- 		require("lsp_signature").setup({
	-- 			bind = true, -- This is mandatory, otherwise border config won't get registered.
	-- 			handler_opts = {
	-- 				border = "rounded",
	-- 			},
	-- 			floating_window = false,
	-- 		})
	-- 	end,
	-- },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},
	{
		"folke/twilight.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	-- lazy.nvim
	{
		"m4xshen/hardtime.nvim",
		dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
		opts = {},
	},
	-- lazy.nvim
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			{
				"rcarriga/nvim-notify",
			},
		},
	},
	{
		"chrisgrieser/nvim-early-retirement",
		config = true,
		event = "VeryLazy",
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({})
		end,
	},
	{ "wellle/targets.vim" },
	--[[ { "jay-babu/mason-nvim-dap.nvim" }, ]]
	--[[ { ]]
	--[[ 	"zbirenbaum/copilot.lua", ]]
	--[[ 	cmd = "Copilot", ]]
	--[[ 	event = "InsertEnter", ]]
	--[[ 	config = function() ]]
	--[[ 		require("copilot").setup({}) ]]
	--[[ 	end, ]]
	--[[ }, ]]
})
