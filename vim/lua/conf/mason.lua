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
        "bufls",
        "tsserver",
        "solidity",
        "clangd",
        "jsonls",
        "pylsp",
    },
})

local servers = {
    lua_ls = require("lsp.lua_ls"),
    gopls = require("lsp.gopls"),
    golangci_lint_ls = require("lsp.universal"),
    rust_analyzer = require("lsp.rust_analyzer"),
    taplo = require("lsp.taplo"),
    bufls = require("lsp.universal"),
    tsserver = require("lsp.universal"),
    solidity = require("lsp.solidity"),
    clangd = require("lsp.clangd"),
    jsonls = require("lsp.universal"),
    pylsp = require("lsp.pylsp"),
}

for name, config in pairs(servers) do
    config.on_setup(require("lspconfig")[name])
end

require("lsp.ui")
