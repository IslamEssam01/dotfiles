require("mini.sessions").setup({
    file = "local",
})

require("mini.starter").setup({
    content_hooks = {
        require("mini.starter").gen_hook.adding_bullet(""),
        require("mini.starter").gen_hook.aligning("center", "center"),
    },
    footer = os.date(),
    header = table.concat({
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[───────────────────────────────────────────────────────────────────────]], }
    , "\n"),
    query_updaters = [[abcdefghilmoqrstuvwxyz0123456789_-,.ABCDEFGHIJKLMOQRSTUVWXYZ]],
})

vim.keymap.set("n", "<leader>ms", ": lua MiniSessions.write('')<Left><Left>", { desc = "MiniSessions write" })
vim.keymap.set("n", "<leader>rs", ": lua MiniSessions.read('')<Left><Left>", { desc = "MiniSessions read" })
vim.keymap.set("n", "<leader>ds", ": lua MiniSessions.delete('')<Left><Left>", { desc = "MiniSessions delete" })
vim.keymap.set("n", "<leader>mls", "<cmd> mksession! local<CR>", { desc = "Make local session" })
