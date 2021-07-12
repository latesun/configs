vimrc = $(HOME)/.vimrc
nvim = $(HOME)/.config/nvim
plug.vim = $(HOME)/.local/share/nvim/site/autoload/plug.vim
raw = raw.githubusercontent.com
hosts = /etc/hosts

.PHONY: vim.simple
vim.simple:
ifeq (, $(wildcard $(vimrc)))
	cp vim/vimrc ~/.vimrc
endif

.PHONY: vim.full
vim.full: github.host
ifeq (, $(wildcard $(plug.vim)))
	curl -fLo $(plug.vim) --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
ifeq (, $(wildcard $(nvim)))
	mkdir -p $(nvim)
	cp vim/{init.vim,coc-settings.json} $(nvim)
endif
