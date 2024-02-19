vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {
	desc = "substitute and replace word under cursor",
})

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

vim.keymap.set({ "n", "t" }, "<C-h>", "<cmd> NavigatorLeft<CR>")
vim.keymap.set({ "n", "t" }, "<C-l>", "<cmd> NavigatorRight<CR>")
vim.keymap.set({ "n", "t" }, "<C-j>", "<cmd> NavigatorDown<CR>")
vim.keymap.set({ "n", "t" }, "<C-k>", "<cmd> NavigatorUp<CR>")

vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")

vim.keymap.set("n", "<S-l>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-h>", "<cmd>bprevious<CR>")
