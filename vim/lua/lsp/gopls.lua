vim.cmd([[
	autocmd BufWritePre *.go lua vim.lsp.buf.format(nil, 200)
]])

local base = require("lsp.base")

local opts = {
    on_attach = function(client, bufnr)
        base.attach(bufnr)
    end,
    settings = {
        gopls = {
            gofumpt = true,
        },
    },
}

return {
    on_setup = function(server)
        server.setup(opts)
    end,
}
