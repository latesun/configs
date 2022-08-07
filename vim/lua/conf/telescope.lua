require("telescope").setup({
    pickers = {
        find_files = {
            theme = "dropdown",
            find_command = { "rg", "--no-ignore", "--hidden", "--files" },
        },
        live_grep = { theme = "dropdown" },
        buffers = { theme = "dropdown" },
        help_tags = { theme = "dropdown" },
        oldfiles = { theme = "dropdown" },
        marks = { theme = "dropdown" },
    },
    extensions = {
        fzf = { case_mode = "ignore_case" },
    },
})
require("telescope").load_extension("fzf")

-- find files
keymap.g("n", "<leader>ff", "<cmd>Telescope find_files<CR>", keymap.opts)
-- find text
keymap.g("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", keymap.opts)
-- find buffers
keymap.g("n", "<leader>fb", "<cmd>Telescope buffers<CR>", keymap.opts)
-- find help docs
keymap.g("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", keymap.opts)
-- find last recent used files
keymap.g("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", keymap.opts)
-- find marks
keymap.g("n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<CR>", keymap.opts)
