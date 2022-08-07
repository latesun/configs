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
                require("conf.alpha")
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

        -- buffer
        use({
            "akinsho/bufferline.nvim",
            config = function()
                require("conf.bufferline")
            end,
        })

        -- telescope
        use({
            "nvim-telescope/telescope.nvim",
            requires = {
                { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            },
            config = function()
                require("conf.telescope")
            end,
        })

        -- lsp easy installer
        use({
            "williamboman/nvim-lsp-installer",
            config = function()
                require("conf.nvim-lsp-installer")
            end,
        })

        -- base lsp
        use("neovim/nvim-lspconfig")

        -- lsp ui
        use("tami5/lspsaga.nvim")

        -- completion
        use({
            "hrsh7th/nvim-cmp",
            requires = {
                { "hrsh7th/cmp-nvim-lsp" },
                { "hrsh7th/cmp-path" },
                { "hrsh7th/cmp-cmdline" },
                { "hrsh7th/cmp-buffer" },
                { "hrsh7th/vim-vsnip" }, -- snippet
                { "onsails/lspkind-nvim" }, -- icon
                { "f3fora/cmp-spell" },
                { "tzachar/cmp-tabnine", run = "./install.sh" },
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

        -- format
        use({
            "jose-elias-alvarez/null-ls.nvim",
            config = function()
                require("conf.null-ls")
            end,
        })

        -- tags
        use({
            "simrat39/symbols-outline.nvim",
            config = function()
                require("conf.symbols-outline")
            end,
        })

        use("lfv89/vim-interestingwords")

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

        -- easymontion
        use({
            "phaazon/hop.nvim",
            config = function()
                require("conf.hop")
            end,
        })

        -- display search result
        use({
            "kevinhwang91/nvim-hlslens",
            config = function()
                require("conf.nvim-hlslens")
            end,
        })

        use({
            "yamatsum/nvim-cursorline",
            config = function()
                require("nvim-cursorline").setup({
                    cursorline = {
                        enable = true,
                        timeout = 1000,
                        number = false,
                    },
                    cursorword = {
                        enable = true,
                        min_length = 3,
                        hl = { underline = true },
                    },
                })
            end,
        })

        -- find and replace
        use({
            "nvim-pack/nvim-spectre",
            config = function()
                require("conf.nvim-spectre")
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
