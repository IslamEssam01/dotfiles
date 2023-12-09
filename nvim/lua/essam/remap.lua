vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

vim.keymap.set("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>")
vim.keymap.set("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>")
vim.keymap.set("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>")

vim.keymap.set("n", "<C-n>", "<cmd>:NvimTreeToggle<CR>")
vim.keymap.set("n", "<leader>e", "<cmd>:NvimTreeFocus<CR>")
vim.keymap.set("n", "<leader>pv", "<cmd>:NvimTreeFocus<CR>")

vim.keymap.set("n", "<S-l>", "<cmd>:bnext<CR>")
vim.keymap.set("n", "<S-h>", "<cmd>:bprevious<CR>")

vim.keymap.set("n", "<leader>g", "<cmd>:LazyGit<cr>")

-- vim.keymap.set("i", "<S-Tab>", "<C-d>")

-- for dap
vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>")
vim.keymap.set("n", "<leader>dc", "<cmd> DapContinue <CR>")
vim.keymap.set("n", "<leader>dr", "<cmd> lua require('dapui').open({reset=true}) <CR>")
vim.keymap.set("n", "<leader>dt", "<cmd> lua require('dapui').toggle() <CR>")
