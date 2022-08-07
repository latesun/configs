require("bufferline").setup({
    options = {
        numbers = "ordinal",
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
        },
    },
})

-- swith the previous buffer
keymap.g("n", "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", keymap.opts)
-- swith the next buffer
keymap.g("n", "<leader>bn", "<cmd>BufferLineCycleNext<CR>", keymap.opts)
-- delete current buffer
keymap.g("n", "<leader>bd", "<cmd>Bdelete!<CR>", keymap.opts)
