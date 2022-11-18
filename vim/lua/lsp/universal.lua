local base = require("lsp.base")
local opts = {
    capabilities = base.capabilities,
    flags = base.flags,
    on_attach = function(client, bufnr)
        base.disableFormat(client)
        base.attach(bufnr)
    end,
}

return {
    on_setup = function(server)
        server.setup(opts)
    end,
}
