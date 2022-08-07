require("nvim-treesitter.configs").setup({
    ensure_installed = { "go", "lua", "rust", "solidity", "json", "yaml", "gomod", "c", "cpp" },
    indent = {
        enable = true,
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true,
    },
    context_commentstring = {
        enable = true,
    },
})
