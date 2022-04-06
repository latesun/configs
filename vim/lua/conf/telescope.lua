-- https://github.com/nvim-telescope/telescope.nvim
-- WARN: telescope 手动安装依赖 fd 和 repgrep
-- https://github.com/sharkdp/fd
-- https://github.com/BurntSushi/ripgrep

require("telescope").setup({
	pickers = {
		find_files = {
			theme = "dropdown",
			prompt_prefix = "🔍",
			find_command = { "rg", "--no-ignore", "--hidden", "--files" },
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
})
require("telescope").load_extension("fzf")

-- find files
-- keymap.g("n", "<leader>ff", "<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files<CR>", keymap.opts)
keymap.g("n", "<leader>ff", "<cmd>Telescope find_files<CR>", keymap.opts)
-- find text
keymap.g("n", "<leader>fg", "<cmd>Telescope live_grep theme=dropdown prompt_prefix=🔍<CR>", keymap.opts)
-- find buffers
keymap.g("n", "<leader>fb", "<cmd>Telescope buffers theme=dropdown<CR>", keymap.opts)
-- find help docs
keymap.g("n", "<leader>fh", "<cmd>Telescope help_tags theme=dropdown<CR>", keymap.opts)
-- find last recent used files
keymap.g("n", "<leader>fo", "<cmd>Telescope oldfiles theme=dropdown<CR>", keymap.opts)
-- find marks
keymap.g("n", "<leader>fm", "<cmd>Telescope marks theme=dropdown<CR>", keymap.opts)
