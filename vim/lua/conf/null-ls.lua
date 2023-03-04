local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting

local sources = {
    formatting.stylua,
    formatting.prettier,
    formatting.buf,
    formatting.clang_format,
}

null_ls.setup({
    sources = sources,
    on_attach = function(client)
        if client.server_capabilities.documentFormattingProvider then
            vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
        end
    end,
})
