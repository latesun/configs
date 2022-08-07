require("nvim-tree").setup({
    view = {
        width = 32,
    },
    diagnostics = {
        enable = true,
    },
    git = {
        ignore = false,
    },
    renderer = {
        add_trailing = true,
    },
})

keymap.g("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", keymap.opts)
