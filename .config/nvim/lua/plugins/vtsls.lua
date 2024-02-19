return {
	"yioneko/nvim-vtsls",
	config = function()
		require("vtsls").config({
			-- customize handlers for commands
			-- handlers = {
			-- 	source_definition = function(err, locations) end,
			-- 	file_references = function(err, locations) end,
			-- 	code_action = function(err, actions) end,
			-- },
			-- automatically trigger renaming of extracted symbol
			refactor_auto_rename = true,
            -- refactor_move_to_file = {
            -- 	-- If dressing.nvim is installed, telescope will be used for selection prompt. Use this to customize
			-- 	-- the opts for telescope picker.
			-- 	telescope_opts = function(items, default) end,
			-- },
		})
	end,
}
