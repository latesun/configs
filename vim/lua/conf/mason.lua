require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "gopls",
        "golangci_lint_ls",
        "rust_analyzer",
        "taplo",
        "yamlls",
        "jsonls",
        "bufls",
    },
})

local servers = {
    lua_ls = require("lsp.lua_ls"),
    gopls = require("lsp.gopls"),
    golangci_lint_ls = require("lsp.universal"),
    rust_analyzer = require("lsp.rust_analyzer"),
    taplo = require("lsp.taplo"),
    yamlls = require("lsp.yamlls"),
    jsonls = require("lsp.universal"),
    bufls = require("lsp.universal"),
}

for name, config in pairs(servers) do
    config.on_setup(require("lspconfig")[name])
end

require("lsp.ui")
