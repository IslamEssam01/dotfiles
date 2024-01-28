return {
	{ "mbbill/undotree" },

	{
		"windwp/nvim-autopairs",
		dependencies = {
			{ "windwp/nvim-ts-autotag" },
		},
		event = "InsertEnter",
		opts = {
			fast_wrap = {},
		}, -- this is equalent to setup({}) function
	},
	{ "christoomey/vim-tmux-navigator" },

	{
		"roobert/surround-ui.nvim",
		dependencies = {
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

			{ "folke/which-key.nvim" },
		},
		config = function()
			require("surround-ui").setup({
				root_key = "S",
			})
		end,
	},

	{
		"kdheepak/lazygit.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"norcalli/nvim-colorizer.lua",

		config = function()
			require("colorizer").setup()
		end,
	},
	{ "f-person/git-blame.nvim" },
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
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
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
		"andymass/vim-matchup",
		config = function()
			vim.g.matchup_matchparen_enabled = 0
		end,
	},
	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
	{
		"chrisgrieser/nvim-early-retirement",
		config = true,
		event = "VeryLazy",
	},
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup({
				-- All these keys will be mapped to their corresponding default scrolling animation
				mappings = {
					"<C-u>",
					"<C-d>",
					"<C-b>",
					"<C-f>",
					-- "<C-y>",
					-- "<C-e>",
					"zt",
					"zz",
					"zb",
				},
				hide_cursor = true, -- Hide cursor while scrolling
				stop_eof = true, -- Stop at <EOF> when scrolling downwards
				respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				easing_function = nil, -- Default easing function
				pre_hook = nil, -- Function to run before the scrolling animation starts
				post_hook = nil, -- Function to run after the scrolling animation ends
				performance_mode = true, -- Disable "Performance Mode" on all buffers.
			})
		end,
	},
	{ "wellle/targets.vim" },
	{
		"RRethy/vim-illuminate",

		config = function()
			vim.keymap.set(
				"n",
				"]]",
				'<cmd> lua require("illuminate").goto_next_reference() <CR>',
				{ desc = "go to next reference" }
			)
			vim.keymap.set(
				"n",
				"[[",
				'<cmd> lua require("illuminate").goto_prev_reference() <CR>',
				{ desc = "go to next reference" }
			)
		end,
	},
	{
		"ggandor/leap.nvim",
		init = function()
			require("leap").add_default_mappings()
		end,
		dependencies = {
			"tpope/vim-repeat",
		},
		lazy = false,
	},
	{

		"jinh0/eyeliner.nvim",
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true, -- show highlights only after keypress
				dim = true, -- dim all other characters if set to true (recommended!)
				match = "[0-9a-zA-Z]",
			})
		end,
	},
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	-- dadbod , copilot
}
