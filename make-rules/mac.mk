.PHONY: mac.tools
mac.tools: mac.base mac.nvim mac.tmux

.PHONY: mac.base
mac.base:
ifeq (, $(shell type neofetch))
	@echo "[INFO]: install neofetch..."
	brew install neofetch
endif
ifeq (, $(shell type exa))
	@echo "[INFO]: install exa..."
	brew install exa 
endif
ifeq (, $(shell type fzf))
	@echo "[INFO]: install fzf..."
	brew install fzf
endif
ifeq (, $(shell type rg))
	@echo "[INFO]: install ripgrep..."
	brew install ripgrep
endif
ifeq (, $(shell type go))
	@echo "[INFO]: install go..."
	brew install go
endif

.PHONY: mac.nvim
mac.nvim:
ifeq (, $(shell type node))
	@echo "[INFO]: install nodejs..."
	curl -sL install-node.now.sh/lts | bash
endif
ifeq (, $(shell type nvim))
	@echo "[INFO]: install neovim..."
	brew install --HEAD neovim
endif

.PHONY: mac.tmux
mac.tmux: common.tpm
ifeq (, $(shell type tmux))
	@echo "[INFO]: install tmux..."
	brew install --HEAD tmux
endif

.PHONY: mac.zsh
mac.zsh:
ifeq (, $(shell type zsh))
	@echo "[INFO]: install zsh..."
	brew install --HEAD zsh
endif
ifeq (, $(wildcard $(zshrc)))
	cp zshrc/mac.zsh $(zshrc)
endif
