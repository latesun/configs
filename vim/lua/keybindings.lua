vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

keymap = {
	g = vim.api.nvim_set_keymap,
	b = vim.api.nvim_buf_set_keymap,
	opts = { noremap = true, silent = true },
}

-- remap window switch
keymap.g("n", "<c-h>", "<c-w>h", keymap.opts)
keymap.g("n", "<c-j>", "<c-w>j", keymap.opts)
keymap.g("n", "<c-k>", "<c-w>k", keymap.opts)
keymap.g("n", "<c-l>", "<c-w>l", keymap.opts)

-- remap exit
keymap.g("i", "jk", "<ESC>", {})
keymap.g("i", "<leader>w", "<cmd>:w<CR>", {})
keymap.g("n", "<leader>w", ":w<cr>", {})
keymap.g("n", "<ESC>", "<cmd>noh<CR><ESC>", keymap.opts)

-- remap
keymap.g("n", "<leader>u", ":PackerSync<cr>", keymap.opts)

-- 临时放这里
keymap.g("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", keymap.opts)
keymap.g("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", keymap.opts)
keymap.g("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", keymap.opts)
