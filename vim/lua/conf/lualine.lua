require("lualine").setup({
    options = {
        theme = "gruvbox",
    },

    sections = {
        lualine_a = {
            "fileformat",
        },
        lualine_x = {
            "encoding",
            "filetype",
        },
    },
})
