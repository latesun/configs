.PHONY: ubuntu.tools
ubuntu.tools: ubuntu.base ubuntu.tmux ubuntu.nvim ubuntu.go ubuntu.lazygit

.PHONY: ubuntu.base
ubuntu.base:
	sudo apt update
ifeq (, $(shell type curl))
	@echo "[INFO]: install curl..."
	sudo apt install -y curl
	@echo "[INFO]: install curl finished."
endif
ifeq (, $(shell type mosh))
	@echo "[INFO]: install openssh-server..."
	sudo apt install -y openssh-server 
	@echo "[INFO]: install openssh-server finished."
endif
ifeq (, $(shell type mosh))
	@echo "[INFO]: install mosh..."
	sudo apt install -y mosh
	@echo "[INFO]: install mosh finished."
endif
ifeq (, $(shell type exa))
	@echo "[INFO]: install exa..."
	sudo apt install -y exa 
	@echo "[INFO]: install exa finished."
endif
ifeq (, $(shell type neofetch))
	@echo "[INFO]: install neofetch..."
	sudo apt install -y neofetch 
	@echo "[INFO]: install neofetch finished."
endif
ifeq (, $(shell type rg))
	@echo "[INFO]: install ripgrep..."
	sudo apt install -y ripgrep 
	@echo "[INFO]: install ripgrep finished."
endif
ifeq (, $(shell type fzf))
	@echo "[INFO]: install fzf..."
	sudo apt install -y fzf 
	@echo "[INFO]: install fzf finished."
endif
ifeq (, $(shell type v2ray))
	@echo "[INFO]: install v2ray..."
	sudo apt-get install -y v2ray
	@echo "[INFO]: install v2ray finished."
endif

ifeq (, $(shell type ctags))
	@echo "[INFO]: install ctags..."
	sudo apt install universal-ctags
	@echo "[INFO]: install ctags finished."
endif

.PHONY: ubuntu.tmux
ubuntu.tmux: common.tpm
ifeq (, $(shell type tmux))
	@echo "[INFO]: install tmux..."
	sudo apt install -y tmux 
	@echo "[INFO]: install tmux finished."
endif

.PHONY: ubuntu.nvim
ubuntu.nvim:
ifeq (, $(shell type node))
	@echo "[INFO]: install nodejs..."
	sudo apt install -y nodejs npm
	npm config set registry https://registry.npm.taobao.org
	@echo "[INFO]: install nodejs finished."
endif
ifeq (, $(shell type nvim))
	@echo "[INFO]: install neovim..."
	sudo add-apt-repository ppa:neovim-ppa/unstable
	sudo apt update && sudo apt install -y neovim python3-neovim
	@echo "[INFO]: install neovim finished."
endif

.PHONY: ubuntu.go
ubuntu.go:
ifeq (, $(shell type go))
	@echo "[INFO]: install golang..."
	sudo add-apt-repository ppa:longsleep/golang-backports
	sudo apt update && sudo apt install -y golang-go
	@echo "[INFO]: install golang finished."
endif

.PHONY: ubuntu.lazygit
ubuntu.lazygit:
ifeq (, $(shell type lazygit))
	@echo "[INFO]: install lazygit..."
	sudo add-apt-repository ppa:lazygit-team/release
	sudo apt-get update && sudo apt-get install -y lazygit
	@echo "[INFO]: install lazygit finished."
endif

.PHONY: ubuntu.zsh
ifeq (, $(shell type zsh))
	@echo "[INFO]: install zsh..."
	sudo apt install -y zsh
	@echo "[INFO]: install zsh finished."
endif
ifeq (, $(wildcard $(zshrc)))
	cp zshrc/ubuntu.zsh $(zshrc)
	chsh -s $$(which zsh)
endif
