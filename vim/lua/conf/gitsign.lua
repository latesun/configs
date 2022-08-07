require("gitsigns").setup({
    signs = {
        add = { hl = "GitSignsAdd", text = "A", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "M", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "D", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    },
    current_line_blame = true,
})
