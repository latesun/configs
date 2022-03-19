-- https://github.com/nvim-telescope/telescope.nvim
-- WARN: telescope 手动安装依赖 fd 和 repgrep
-- https://github.com/sharkdp/fd
-- https://github.com/BurntSushi/ripgrep

require("telescope").setup({})
-- require("telescope").setup({
-- 	extensions = {
-- 		["ui-select"] = {
-- 			require("telescope.themes").get_dropdown({
-- 				-- even more opts
-- 			}),
-- 		},
-- 	},
-- })
--
-- -- To get fzf loaded and working with telescope, you need to call
-- -- load_extension, somewhere after setup function:
-- require("telescope").load_extension("ui-select")

-- find files
keymap.g(
	"n",
	"<leader>ff",
	"<cmd>Telescope find_files find_command=rg,--no-ignore,--hidden,--files theme=dropdown prompt_prefix=🔍<CR>",
	keymap.opts
)
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
