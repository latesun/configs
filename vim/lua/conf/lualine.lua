require("lualine").setup({
    options = {
        theme = "gruvbox",
    },

    sections = {
        lualine_a = { { "fileformat", symbols = { unix = "" } } },
        lualine_x = { "encoding", "filetype" },
    },
})
