vim.opt.shell = "/bin/bash"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.termbidi = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.completeopt = { "menuone", "noselect" }

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false

vim.opt.backup = false

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 999
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.g.mapleader = " "
vim.o.timeout = true
vim.o.timeoutlen = 500

vim.opt.mouse = "a"

-- this is for comments
vim.cmd([[autocmd FileType * set formatoptions-=cro]])

vim.opt.inccommand = "split"

--vim.cmd([[autocmd TextChanged,TextChangedI * if &buftype=="" && !&readonly | silent write|endif]])
--[[ vim.opt.updatetime = 1000 ]]
--[[ vim.cmd( [[autocmd InsertLeave,InsertLeavePre,BufLeave,FocusLost,CursorHold,CursorHoldI * if &buftype=="" && !&readonly |silent update  | endif]]

-- vim.api.nvim_create_autocmd({ "InsertLeave", "InsertLeavePre", "BufLeave", "FocusLost" }, {
-- 	pattern = { "*" },
-- 	callback = function(client, bufnr)
-- 		if vim.bo.buftype == "" and not vim.bo.readonly then
-- 			vim.api.nvim_command("silent update")
-- 		end
-- 	end,
-- })
--[[ vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
vim.diagnostic.config({
	update_in_insert = true,
})
vim.g.skip_ts_context_commentstring_module = true
