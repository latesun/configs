vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

keymap = {
    g = vim.api.nvim_set_keymap,
    b = vim.api.nvim_buf_set_keymap,
    opts = { noremap = true, silent = true },
}

-- window switch
keymap.g("n", "<c-h>", "<c-w>h", keymap.opts)
keymap.g("n", "<c-j>", "<c-w>j", keymap.opts)
keymap.g("n", "<c-k>", "<c-w>k", keymap.opts)
keymap.g("n", "<c-l>", "<c-w>l", keymap.opts)

-- exit
keymap.g("i", "jk", "<esc>", {})
keymap.g("i", "<leader>w", "<cmd>w<cr>", {})
keymap.g("n", "<leader>w", "<cmd>w<cr>", {})
keymap.g("n", "<esc>", "<cmd>noh<cr><esc>", keymap.opts)

-- packer
keymap.g("n", "<leader>u", "<cmd>PackerSync<cr>", keymap.opts)

-- alpha
keymap.g("n", "<leader>a", "<cmd>Alpha<cr>", keymap.opts)

-- hlslens
keymap.g("n", "*", "*<cmd>lua require('hlslens').start()<cr>", keymap.opts)
keymap.g("n", "#", "#<cmd>lua require('hlslens').start()<cr>", keymap.opts)
keymap.g("n", "g*", "g*<cmd>lua require('hlslens').start()<cr>", keymap.opts)
keymap.g("n", "g#", "g#<cmd>lua require('hlslens').start()<cr>", keymap.opts)

-- nvim-tree
keymap.g("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", keymap.opts)

-- tags
keymap.g("n", "tt", "<cmd>SymbolsOutline<cr>", keymap.opts)

-- telescope
keymap.g("n", "<leader>ff", "<cmd>Telescope find_files<cr>", keymap.opts)
keymap.g("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", keymap.opts)
keymap.g("n", "<leader>fb", "<cmd>Telescope buffers<cr>", keymap.opts)
keymap.g("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", keymap.opts)
keymap.g("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", keymap.opts)
keymap.g("n", "<leader>fm", "<cmd>Telescope marks<cr>", keymap.opts)

-- interestingwords
keymap.g("n", "<leader>k", "<cmd>Interestingwords --toggle<cr>", keymap.opts)
keymap.g("n", "<leader>K", "<cmd>Interestingwords --remove_all<cr>", keymap.opts)
keymap.g("n", "<leader>n", "<cmd>Interestingwords --navigate<cr>", keymap.opts)

-- lsp
local lsp = {
    rename = "<leader>rn",
    code_action = "<leader>ca",
    definition = "gd",
    references = "gr",
    implementations = "gi",
    diagnostics = "go",
    hover = "K",
    previous = "<C-p>",
    next = "<C-n>",
}

keymap.lsp = function(map)
    -- lspsaga
    map("n", lsp.rename, "<cmd>Lspsaga rename<cr>", keymap.opts)
    map("n", lsp.code_action, "<cmd>Lspsaga code_action<cr>", keymap.opts)
    map("n", lsp.hover, "<cmd>Lspsaga hover_doc<cr>", keymap.opts)
    map("n", lsp.previous, "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", keymap.opts)
    map("n", lsp.next, "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", keymap.opts)

    -- telescope
    local dropdown = require("telescope.themes").get_dropdown()
    map("n", lsp.definition, function()
        require("telescope.builtin").lsp_definitions(dropdown)
    end)
    map("n", lsp.implementations, function()
        require("telescope.builtin").lsp_implementations(dropdown)
    end)
    map("n", lsp.references, function()
        require("telescope.builtin").lsp_references(dropdown)
    end)
    map("n", lsp.diagnostics, function()
        require("telescope.builtin").diagnostics(dropdown)
    end)
end
