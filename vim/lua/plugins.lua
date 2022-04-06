local packer = require("packer")

packer.startup({
	function()
		-- package manager
		use("wbthomason/packer.nvim")

		-- beautiful icons
		use("kyazdani42/nvim-web-devicons")

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

		-- star page
		use({
			"goolord/alpha-nvim",
			config = function()
				require("conf.alpha")
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
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
			},
			config = function()
				require("conf.telescope")
			end,
		})

		-- base lsp
		use({
			"neovim/nvim-lspconfig",
			config = function()
				require("conf.nvim-lspconfig")
			end,
		})

		-- lsp easy installer
		use({
			"williamboman/nvim-lsp-installer",
			config = function()
				require("conf.nvim-lsp-installer")
			end,
		})

		use({
			"tami5/lspsaga.nvim",
			config = function()
				require("conf.lspsaga")
			end,
		})

		-- 自动代码补全系列插件
		use({
			"hrsh7th/nvim-cmp", -- 代码补全核心插件，下面都是增强补全的体验插件
			requires = {
				{ "onsails/lspkind-nvim" }, -- 为补全添加类似 vscode 的图标
				{ "hrsh7th/vim-vsnip" }, -- vsnip 引擎，用于获得代码片段支持
				{ "hrsh7th/cmp-vsnip" }, -- 适用于 vsnip 的代码片段源
				{ "hrsh7th/cmp-nvim-lsp" }, -- 替换内置 omnifunc，获得更多补全
				{ "hrsh7th/cmp-path" }, -- 路径补全
				{ "hrsh7th/cmp-buffer" }, -- 缓冲区补全
				{ "hrsh7th/cmp-cmdline" }, -- 命令补全
				{ "f3fora/cmp-spell" }, -- 拼写建议
				{ "rafamadriz/friendly-snippets" }, -- 提供多种语言的代码片段
				{ "lukas-reineke/cmp-under-comparator" }, -- 让补全结果的排序更加智能
				{ "tzachar/cmp-tabnine", run = "./install.sh" }, -- tabnine 源,提供基于 AI 的智能补全
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
				"p00f/nvim-ts-rainbow", -- 彩虹括号
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

		-- use({
		-- 	"simrat39/rust-tools.nvim",
		-- 	config = function()
		-- 		require("conf.rust-tools")
		-- 	end,
		-- })

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
			requires = "nvim-lua/plenary.nvim",
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

		-- translator
		use({
			"uga-rosa/translate.nvim",
			config = function()
				require("conf.translate")
			end,
		})

		-- display search result
		use({
			"kevinhwang91/nvim-hlslens",
			config = function()
				require("conf.nvim-hlslens")
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
