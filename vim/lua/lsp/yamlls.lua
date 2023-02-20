vim.cmd([[
	autocmd BufWritePre *.yaml lua vim.lsp.buf.format(nil, 200)
]])

local base = require("lsp.base")

local opts = {
    on_attach = function(client, bufnr)
        base.attach(bufnr)
    end,
}

return {
    on_setup = function(server)
        server.setup(opts)
    end,
}
