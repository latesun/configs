local packer = require("packer")

packer.startup({
    function()
        -- package manager
        use("wbthomason/packer.nvim")

        -- beautiful icons
        use("kyazdani42/nvim-web-devicons")

        -- lua base functions
        use("nvim-lua/plenary.nvim")

        -- star page
        use({
            "goolord/alpha-nvim",
            config = function()
                require("alpha").setup(require("alpha.themes.startify").config)
            end,
        })

        -- theme
        use({
            "ellisonleao/gruvbox.nvim",
            config = function()
                require("conf.gruvbox")
            end,
        })

        -- status line theme
        use({
            "nvim-lualine/lualine.nvim",
            config = function()
                require("conf.lualine")
            end,
        })

        -- directory tree
        use({
            "kyazdani42/nvim-tree.lua",
            config = function()
                require("conf.nvim-tree")
            end,
        })

        -- telescope
        use({
            "nvim-telescope/telescope.nvim",
            config = function()
                require("conf.telescope")
            end,
        })

        -- lsp
        use({
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "tami5/lspsaga.nvim", -- ui
        })

        -- format
        use({
            "jose-elias-alvarez/null-ls.nvim",
            config = function()
                require("conf.null-ls")
            end,
        })

        -- neovim development tool
        use("folke/neodev.nvim")

        -- completion
        use({
            "hrsh7th/nvim-cmp",
            requires = {
                { "hrsh7th/cmp-nvim-lsp" },
                { "hrsh7th/cmp-path" },
                { "hrsh7th/cmp-cmdline" },
                { "hrsh7th/cmp-buffer" },
                { "onsails/lspkind-nvim" }, -- icon
                { "f3fora/cmp-spell" },
                { "jcdickinson/codeium.nvim" },
            },
            config = function()
                require("conf.nvim-cmp")
            end,
        })

        -- highlight
        use({
            "nvim-treesitter/nvim-treesitter",
            run = { ":TSupdate" },
            requires = {
                "p00f/nvim-ts-rainbow", -- rainbow parentheses
            },
            config = function()
                require("conf.nvim-treesitter")
            end,
        })

        -- tags
        use({
            "simrat39/symbols-outline.nvim",
            config = function()
                require("conf.symbols-outline")
            end,
        })

        use("leisiji/interestingwords.nvim")

        -- git
        use({
            "lewis6991/gitsigns.nvim",
            config = function()
                require("conf.gitsign")
            end,
        })

        -- todolist
        use({
            "folke/todo-comments.nvim",
            config = function()
                require("todo-comments").setup({})
            end,
        })

        use({
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup()
            end,
        })

        -- auto jump last exit
        use({
            "ethanholz/nvim-lastplace",
            config = function()
                require("conf.nvim-lastplace")
            end,
        })

        -- comment
        use({
            "terrortylor/nvim-comment",
            config = function()
                require("nvim_comment").setup()
            end,
        })

        -- easy montion
        use({
            "ggandor/leap.nvim",
            config = function()
                require("leap").set_default_keymaps()
            end,
        })

        use({
            "ggandor/flit.nvim",
            config = function()
                require("flit").setup()
            end,
        })

        -- display search result
        use({
            "kevinhwang91/nvim-hlslens",
            config = function()
                require("hlslens").setup()
            end,
        })

        use({
            "yamatsum/nvim-cursorline",
            config = function()
                require("nvim-cursorline").setup()
            end,
        })

        -- tmux
        use({
            "aserowy/tmux.nvim",
            config = function()
                return require("tmux").setup()
            end,
        })
    end,

    -- use float window to display packer.nvim running
    config = {
        display = {
            open_fn = require("packer.util").float,
        },
    },
})

-- auto update plugins when change
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require("conf.mason")
