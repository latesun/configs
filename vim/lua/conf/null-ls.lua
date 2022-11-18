local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local sources = {
    formatting.stylua,
    formatting.goimports,
    formatting.prettier,
    formatting.taplo,
    formatting.buf,
    formatting.autopep8,
}

null_ls.setup({
    sources = sources,
    on_attach = function(client)
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
        end
    end,
})
