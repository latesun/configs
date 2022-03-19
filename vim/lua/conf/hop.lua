require("hop").setup()

keymap.g("n", "<leader>hw", "<cmd>HopWord<CR>", keymap.opts)
keymap.g("n", "<leader>hl", "<cmd>HopLine<CR>", keymap.opts)
keymap.g("n", "<leader>h1", "<cmd>HopChar1<CR>", keymap.opts)
keymap.g("n", "<leader>h2", "<cmd>HopChar2<CR>", keymap.opts)
