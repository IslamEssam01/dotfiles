-- vim.fn.sign_define(
-- 	"DapBreakpoint",
-- 	{ text = "🔴", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
-- )
--
-- local dap = require("dap")
--
-- dap.adapters["pwa-node"] = {
-- 	type = "server",
-- 	host = "127.0.0.1",
-- 	port = 8123,
-- 	executable = {
-- 		command = "js-debug-adapter",
-- 	},
-- }
--
-- dap.configurations["javascript"] = {
-- 	{
-- 		type = "pwa-node",
-- 		request = "launch",
-- 		name = "Launch file",
-- 		program = "${file}",
-- 		cwd = "${workspaceFolder}",
-- 		runtimeExecutable = "node",
-- 	},
-- }
-- dap.configurations["typescript"] = {
-- 	{
-- 		type = "pwa-node",
-- 		request = "launch",
-- 		name = "Launch file with ts-node",
-- 		program = "${file}",
-- 		cwd = "${workspaceFolder}",
-- 		runtimeExecutable = "ts-node",
-- 	},
-- }