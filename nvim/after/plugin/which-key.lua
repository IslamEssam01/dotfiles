local wk = require("which-key")

wk.register({
	p = {
		name = "project",
		d = { "<cmd> Telescope diagnostics <CR>", "fuzzy find diagnostics" },
		s = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "fuzzy find in buffer" },
		b = { "<cmd> Telescope buffers <CR>", "fuzzy find buffers" },
		g = { "<cmd> Telescope live_grep <CR>", "live grep" },
		p = { "<cmd> Telescope sessions_picker", "fuzzy find sessions" },
		f = {
			function()
				require("telescope").extensions.smart_open.smart_open({ cwd_only = true, filename_first = true })
			end,
			"fuzzy find files using smart open",
		},

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
	mm = {
		function()
			require("harpoon"):list():append()
		end,
		"mark file in harpoon",
	},
}, { prefix = "<leader>" })
