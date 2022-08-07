vim.cmd([[
	autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 200)
]])

return {
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = {
                command = "clippy",
            },
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
        },
    },
}
