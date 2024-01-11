
return {}
--[[ return {
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

	opts = {

		cmdline = {
			enabled = false,
			-- view = "cmdline",
		},
		messages = {
			enabled = false,
		},
		popupmenu = {
			enabled = false, -- enables the Noice popupmenu UI
		},
		lsp = {
			progress = {
				enabled = false,
				-- -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
				-- -- See the section on formatting for more details on how to customize.
				-- --- @type NoiceFormat|string
				-- format = "lsp_progress",
				-- --- @type NoiceFormat|string
				-- format_done = "lsp_progress_done",
				-- throttle = 1000 / 30, -- frequency to update lsp progress message
				-- view = "mini",
			},
			override = {
				-- override the default lsp markdown formatter with Noice
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				-- override the lsp markdown formatter with Noice
				["vim.lsp.util.stylize_markdown"] = true,
				-- override cmp documentation with Noice (needs the other options to work)
				["cmp.entry.get_documentation"] = true,
			},
			hover = {
				enabled = false,
			},
			signature = {
				enabled = true,
				auto_open = {
					enabled = true,
					trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
					luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
					throttle = 50, -- Debounce lsp signature help request by 50ms
				},
				view = nil, -- when nil, use defaults from documentation
				---@type NoiceViewOptions
				opts = {}, -- merged with defaults from documentation
			},
			message = {
				-- Messages shown by lsp servers
				enabled = true,
				view = "notify",
				opts = {},
			},
			-- defaults for hover and signature help
			documentation = {
				view = "hover",
				---@type NoiceViewOptions
				opts = {
					lang = "markdown",
					replace = true,
					render = "plain",
					format = { "{message}" },
					win_options = { concealcursor = "n", conceallevel = 3 },
				},
			},
		},
		presets = {
			-- you can enable a preset by setting it to true, or a table that will override the preset config
			-- you can also add custom presets that you can enable/disable with enabled=true
			long_message_to_split = true, -- long messages will be sent to a split
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		routes = {
			{
				filter = { event = "notify", find = "No information available" },
				opts = { skip = true },
			},
		},
	},
} ]]
