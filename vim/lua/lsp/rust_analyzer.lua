vim.cmd([[
	autocmd BufWritePre *.rs lua vim.lsp.buf.format(nil, 200)
]])

local base = require("lsp.base")

local opts = {
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
    on_attach = function(client, bufnr)
        base.attach(bufnr)
    end,
}

return {
    on_setup = function(server)
        server.setup(opts)
    end,
}
