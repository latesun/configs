-- https://github.com/sumneko/lua-language-server/wiki/Settings
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local base = require("lsp.base")

local opts = {
    capabilities = base.capabilities,

    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = runtime_path,
            },
            diagnostics = {
                globals = { "vim", "use", "keymap" },
                disable = { "assign-type-mismatch" },
                unusedLocalExclude = { "client" },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach = function(client, bufnr)
        base.disableFormat(client)
        base.attach(bufnr)
    end,
}

return {
    on_setup = function(server)
        require("neodev").setup()
        server.setup(opts)
    end,
}
