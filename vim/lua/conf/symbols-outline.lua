require("symbols-outline").setup({
    width = 30,
    show_numbers = true,
})

keymap.g("n", "tt", "<cmd>SymbolsOutline<CR>", keymap.opts)
