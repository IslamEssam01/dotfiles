require("lspsaga").setup({
    ui = {
        code_action = ""
    },
    symbol_in_winbar = {
        enable = true,
    },
    lightbulb = {
        enable = true,
        sign = false,
    },
})

vim.keymap.set("n", "<leader>a", "<cmd>:Lspsaga outline<cr>")
