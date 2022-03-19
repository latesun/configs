-- 参见：https://github.com/lewis6991/gitsigns.nvim/#keymaps

require("gitsigns").setup({
	-- 设置在左侧的行号列中显示的 git 信息
	signs = {
		add = {
			hl = "GitSignsAdd",
			text = "A",
			numhl = "GitSignsAddNr",
			linehl = "GitSignsAddLn",
		},
		change = {
			hl = "GitSignsChange",
			text = "M",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
		delete = {
			hl = "GitSignsDelete",
			text = "D",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		topdelete = {
			hl = "GitSignsDelete",
			text = "‾",
			numhl = "GitSignsDeleteNr",
			linehl = "GitSignsDeleteLn",
		},
		changedelete = {
			hl = "GitSignsChange",
			text = "~",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
	},

	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
		delay = 1000,
		ignore_whitespace = false,
	},
})
