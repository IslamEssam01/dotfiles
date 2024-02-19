return {
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = true,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>",
					},
					layout = {
						position = "bottom", -- | top | left | right
						ratio = 0.4,
					},
				},
				suggestion = {
					enabled = false,
					auto_trigger = false,
					debounce = 75,
					keymap = {
						accept = "<C-f>",
						accept_word = false,
						accept_line = false,
						next = "<M-]>",
						prev = "<M-[>",
						dismiss = "<C-]>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
				copilot_node_command = "node", -- Node.js version must be > 18.x
				server_opts_overrides = {},
			})
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		opts = {
			show_help = "no", -- Show help text for CopilotChatInPlace, default: yes
			debug = false, -- Enable or disable debug mode, the log file will be in ~/.local/state/nvim/CopilotChat.nvim.log
			disable_extra_info = "no", -- Disable extra information (e.g: system prompt) in the response.
			prompts = {
				Explain = "Explain how it works.",
				Review = "Review the following code and provide concise suggestions.",
				Tests = "Briefly explain how the selected code works, then generate unit tests.",
				Refactor = "Refactor the code to improve clarity and readability.",
			},
		},
		build = function()
			vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
		end,
		event = "VeryLazy",
		keys = {
			{
				"<leader>ccc",
				"<cmd>CopilotChatInPlace<cr>",
				mode = "n",
				desc = "CopilotChat - Run in-place code",
			},
			{ "<leader>cce", "<cmd>CopilotChatExplain<cr>", desc = "CopilotChat - Explain code" },
			{ "<leader>cct", "<cmd>CopilotChatTests<cr>", desc = "CopilotChat - Generate tests" },
			{
				"<leader>ccv",
				":CopilotChatVisual",
				mode = "x",
				desc = "CopilotChat - Open in vertical split",
			},
			{
				"<leader>ccx",
				":CopilotChatInPlace<cr>",
				mode = "x",
				desc = "CopilotChat - Run in-place code",
			},
		},
	},
}
