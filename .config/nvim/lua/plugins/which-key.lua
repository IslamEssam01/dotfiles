return {

	"folke/which-key.nvim",

	dependencies = {
		"ufo",
	},
	opts = {},
	config = function()
		local wk = require("which-key")

		wk.register({
			p = {
				name = "project",
				d = { "<cmd> Telescope diagnostics <CR>", "fuzzy find diagnostics" },
				s = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "fuzzy find in buffer" },
				b = { "<cmd> Telescope buffers <CR>", "fuzzy find buffers" },
				g = { "<cmd> Telescope live_grep <CR>", "live grep" },
				p = { "<cmd> Telescope sessions_picker <CR>", "fuzzy find sessions" },
				f = { "<cmd> Telescope find_files <CR>", "fuzzy find files" },
				l = { "<cmd> Telescope git_files <CR>", "fuzzy find files in git" },

				{
					[["_dp]],
					mode = { "x" },
					"copy without losing the register content",
				},
			},
			Y = {
				[["+Y]],
				"Yank into clipboard",
			},
			y = {
				[["+y]],
				mode = { "n", "v" },
				"yank into clipboard",
			},
			e = {

				"<cmd> NvimTreeFocus <CR>",
				"Focus Nvim Tree",
			},

			g = {
				"<cmd> LazyGit <CR>",
				"Open lazygit",
			},
			d = {
				name = "Dap",
				b = {
					"<cmd> DapToggleBreakpoint <CR>",
					"Toggle BreakPoint",
				},
				c = {
					"<cmd> DapContinue <CR>",
					"Dap Continue Debugging",
				},
				r = {
					"<cmd> lua require('dapui').open({reset=true}) <CR>",
					"Reset DapUi",
				},
				t = {
					"<cmd> lua require('dapui').toggle() <CR>",
					"Toggle DapUi",
				},
			},
			u = {
				"<cmd> UndotreeToggle <CR>",
				"Toggle undotree",
			},
			f = {
				function()
					require("conform").format({ timeout_ms = 3000, lsp_fallback = true })
				end,
				"Format File",
			},
			n = {
				"<cmd> lua require('nabla').popup() <CR>",
				"nabla popup",
			},
			t = {
				"<cmd> lua require('nabla').toggle_virt({autogen=true}) <CR>",
				"nabla toggle virtual line",
			},
		}, { prefix = "<leader>" })
	end,
}
