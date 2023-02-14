local M = {}

M.attach = function(bufnr)
    local function buf_set_keymap(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
    end
    keymap.lsp(buf_set_keymap)
end

M.flags = {
    debounce_text_changes = 150,
}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.disableFormat = function(client)
    if vim.fn.has("nvim-0.8") == 1 then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    else
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end
end

return M
