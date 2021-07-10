## vimrc: base vim config for server machine
vimrc:
	cp vimrc ~/.vimrc

nvim := $(HOME)/.config/nvim
## macos: neovim config for macos
mac:
	# check if neovim exists
ifeq ($(wildcard $(nvim)),)
	mkdir -p $(nvim)
endif
ifneq ("$(wildcard $(nvim)/init.vim"),"")
	@echo "[INFO]: load vimrc..."
	cp vim/{init.vim,coc-settings.json} $(nvim)
	@echo "[INFO]: load vimrc sucessfully."
else
	@echo "[INFO]: vimrc has already existed."
endif

ubuntu:
	# install neovim
