-- search global
keymap.g("n", "<leader>S", "<cmd>lua require('spectre').open()<CR>", keymap.opts)
-- search in current file
keymap.g("n", "<leader>sp", "viw:lua require('spectre').open_file_search()<CR>", keymap.opts)
-- search current word
keymap.g("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", keymap.opts)
