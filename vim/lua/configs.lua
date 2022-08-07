-- indent
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.colorcolumn = "81"

-- ignorecase when query
vim.o.ignorecase = true

vim.g.backup = false

-- 设定各种文本的字符编码
vim.o.encoding = "utf-8"
-- 设定在无操作时，交换文件刷写到磁盘的等待毫秒数（默认为 4000）
vim.o.updatetime = 100
-- 设定等待按键时长的毫秒数
vim.o.timeoutlen = 500
-- 是否允许缓冲区未保存时就切换
vim.o.hidden = true
-- 是否开启 xterm 兼容的终端 24 位色彩支持
vim.o.termguicolors = true
-- 是否高亮当前文本行
vim.o.cursorline = true
-- 是否开启语法高亮
vim.o.syntax = "enable"
-- 是否显示绝对行号
vim.o.number = true
-- 设定光标上下两侧最少保留的屏幕行数
vim.o.scrolloff = 10
-- 是否启用系统剪切板
vim.o.clipboard = "unnamedplus"
-- 是否开启备份文件
vim.o.backup = false
-- 是否开启交换文件
vim.o.swapfile = false
-- 是否开启高亮搜索
vim.o.hlsearch = true
-- 是否开启命令行补全
vim.o.wildmenu = true
-- 是否开启在搜索时如果有大写字母，则关闭忽略大小写的选项
vim.o.smartcase = true
-- 是否开启单词拼写检查
vim.o.spell = true
-- 设定单词拼写检查的语言
vim.o.spelllang = "en_us,cjk"
-- 设定自动缩进的策略为 plugin
vim.o.filetype = "plugin"
vim.o.diffopt = "vertical"

vim.cmd([[
  augroup yaml_like
    autocmd!
    autocmd BufNewFile,BufRead *.yml.example set filetype=yaml
  augroup end
]])

vim.cmd([[
  augroup plantuml_like
    autocmd!
    autocmd BufNewFile,BufRead *.puml set filetype=plantuml
  augroup end
]])
