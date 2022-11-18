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
	}
})
