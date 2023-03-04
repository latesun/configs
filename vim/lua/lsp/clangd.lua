local base = require("lsp.base")

local opts = {
    on_attach = function(client, bufnr)
        base.attach(bufnr)
    end,
}

return {
    on_setup = function(server)
        server.setup(vim.tbl_deep_extend("force", opts, {
            filetypes = { "c", "c++" },
        }))
    end,
}
