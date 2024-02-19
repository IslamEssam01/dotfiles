return {
	"nvim-tree/nvim-tree.lua",

	config = function()
		local api = require("nvim-tree.api")

		local function edit_or_open()
			local node = api.tree.get_node_under_cursor()

			if node.nodes ~= nil then
				-- expand or collapse folder
				api.node.open.edit()
			else
				-- open file
				api.node.open.edit()
				-- Close the tree if file was opened
				api.tree.close()
			end
		end

		-- open as vsplit on current node
		local function vsplit_preview()
			local node = api.tree.get_node_under_cursor()

			if node.nodes ~= nil then
				-- expand or collapse folder
				api.node.open.edit()
			else
				-- open file as vsplit
				api.node.open.vertical()
			end

			-- Finally refocus on tree if it was lost
			api.tree.focus()
		end
		local function my_on_attach(bufnr)
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
			vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
			vim.keymap.set("n", "h", api.node.navigate.parent, opts("Close"))
			vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
		end
		require("nvim-tree").setup({
			on_attach = my_on_attach,
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
				update_cwd = true,
			},
			disable_netrw = true,
			hijack_netrw = true,
			open_on_tab = false,
			hijack_cursor = false,
			update_cwd = true,
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = false,
				icons = {
					error = " ",
					warning = " ",
					info = " ",
					hint = " ",
				},
			},
			git = {
				enable = true,
				timeout = 500,
			},
			renderer = {
				highlight_git = true,
				root_folder_modifier = ":t",
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
						diagnostics = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						git = {
							unstaged = "",
							staged = "S",
							unmerged = "",
							renamed = "➜",
							deleted = "",
							untracked = "U",
							ignored = "◌",
						},
						folder = {
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
						},
					},
				},
			},
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			filters = {
				git_ignored = false,
			},
		})
	end,
}
