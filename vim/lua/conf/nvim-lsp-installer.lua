local lsp_installer_servers = require("nvim-lsp-installer.servers")
local servers = {
    sumneko_lua = require("lsp.sumneko_lua"),
    rust_analyzer = require("lsp.rust_analyzer"),
    golangci_lint_ls = {},
    gopls = {},
    yamlls = {},
    clangd = {},
}

local function attach(client, bufnr)
    keymap.b(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions theme=dropdown<CR>", keymap.opts)
    keymap.b(bufnr, "n", "gi", "<cmd>Telescope lsp_implementations theme=dropdown<CR>", keymap.opts)
    keymap.b(bufnr, "n", "gr", "<cmd>Telescope lsp_references theme=dropdown<CR>", keymap.opts)
    keymap.b(bufnr, "n", "go", "<cmd>Telescope diagnostics theme=dropdown<CR>", keymap.opts)
    keymap.b(bufnr, "n", "<leader>rn", "<cmd>Lspsaga rename<CR>", keymap.opts)
    keymap.b(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<CR>", keymap.opts)
    keymap.b(bufnr, "n", "<C-p>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", keymap.opts)
    keymap.b(bufnr, "n", "<C-n>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", keymap.opts)

    if client.name == "sumneko_lua" or client.name == "gopls" then
        client.server_capabilities.documentFormattingProvider = false
    end
end

-- auto install or start language servers
for svr, opt in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(svr)
    if server_available then
        server:on_ready(function()
            opt.on_attach = attach
            opt.flags = { debounce_text_changes = 150 }
            server:setup(opt)
        end)

        if not server:is_installed() then
            vim.notify("Install Language Server : " .. svr, "WARN", { title = "Language Servers" })
            server:install()
        end
    end
end
