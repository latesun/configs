require("codeium").setup({})

local lspkind = require("lspkind")
local cmp = require("cmp")
cmp.setup({
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "spell" },
        { name = "buffer" },
        { name = "codeium" },
    }),

    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50,
            before = function(entry, vim_item)
                vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                return vim_item
            end,
        }),
    },

    sorting = {
        comparators = {
            cmp.config.compare.recently_used,
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },

    mapping = {
        ["<c-p>"] = cmp.mapping.select_prev_item(),
        ["<c-n>"] = cmp.mapping.select_next_item(),
        ["<cr>"] = cmp.mapping.confirm({ select = true }),
        ["<c-e>"] = cmp.mapping.abort(),
        ["<tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                end
                cmp.confirm()
            else
                fallback()
            end
        end, { "i", "s", "c" }),
    },
})

cmp.setup.cmdline("/", {
    sources = {
        { name = "buffer" },
    },
})

cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
        { name = "path" },
    }, {
        { name = "cmdline" },
    }),
})
