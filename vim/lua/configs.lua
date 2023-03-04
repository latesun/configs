-- indent
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.colorcolumn = "81"

vim.o.encoding = "utf-8"
vim.o.termguicolors = true
vim.o.number = true
vim.o.scrolloff = 10

-- highlight cursor line
vim.o.cursorline = true
-- syntax highlight
vim.o.syntax = "enable"
-- highlight search
vim.o.hlsearch = true

-- ignorecase when searching with all lowercase
vim.o.smartcase = true

-- don't create tmp file
vim.o.backup = false
vim.o.swapfile = false

-- flush interval, default 4000ms
vim.o.updatetime = 100
-- map interval, default 1000ms
vim.o.timeoutlen = 500

-- use system clipboard
-- vim.o.clipboard = "unnamedplus" -- macOS/Linux
local in_wsl = os.getenv("WSL_DISTRO_NAME") ~= nil
if in_wsl then
    vim.g.clipboard = {
        name = "wsl clipboard",
        copy = { ["+"] = { "clip.exe" }, ["*"] = { "clip.exe" } },
        paste = { ["+"] = { "nvim_paste" }, ["*"] = { "nvim_paste" } },
        cache_enabled = true,
    }
end

-- turn on word spell check
vim.o.spell = true
-- word spell check lanuages
vim.o.spelllang = "en_us,cjk"
vim.o.filetype = "plugin"

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

vim.cmd([[
  augroup gomod
    autocmd!
    autocmd BufNewFile,BufRead *.mod set filetype=gomod
  augroup end
]])
