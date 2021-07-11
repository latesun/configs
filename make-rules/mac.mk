.PHONY: mac.tools
mac.tools: mac.base mac.nvim mac.tmux

.PHONY: mac.base
mac.base:
ifeq (, $(shell type neofetch))
	@echo "[INFO]: install neofetch..."
	brew install neofetch
	@echo "[INFO]: install neofetch finished."
endif
ifeq (, $(shell type exa))
	@echo "[INFO]: install exa..."
	brew install exa 
	@echo "[INFO]: install exa finished."
endif
ifeq (, $(shell type fzf))
	@echo "[INFO]: install fzf..."
	brew install fzf
	@echo "[INFO]: install fzf finished."
endif
ifeq (, $(shell type rg))
	@echo "[INFO]: install ripgrep..."
	brew install ripgrep
	@echo "[INFO]: install ripgrep finished."
endif
ifeq (, $(shell type go))
	@echo "[INFO]: install go..."
	brew install go
	@echo "[INFO]: install go finished."
endif
ifeq (, $(shell type kubectl))
	@echo "[INFO]: install kubectl..."
	brew install kubectl kubecolor
	@echo "[INFO]: install kubectl finished."
endif
ifeq (, $(shell type tldr))
	@echo "[INFO]: install tealdeer..."
	brew install tealdeer
	@echo "[INFO]: install tealdeer finished."
endif

.PHONY: mac.nvim
mac.nvim:
ifeq (, $(shell type node))
	@echo "[INFO]: install nodejs..."
	curl -sL install-node.now.sh/lts | bash
	npm config set registry https://registry.npm.taobao.org
	@echo "[INFO]: install nodejs finished."
endif
ifeq (, $(shell type nvim))
	@echo "[INFO]: install neovim..."
	brew install --HEAD neovim
	@echo "[INFO]: install neovim finished."
endif

.PHONY: mac.tmux
mac.tmux: common.tpm
ifeq (, $(shell type tmux))
	@echo "[INFO]: install tmux..."
	brew install --HEAD tmux
	@echo "[INFO]: install tmux finished."
endif

.PHONY: mac.zsh
mac.zsh:
ifeq (, $(shell type zsh))
	@echo "[INFO]: install zsh..."
	brew install --HEAD zsh
	@echo "[INFO]: install zsh finished."
endif
ifeq (, $(wildcard $(zshrc)))
	cp zshrc/mac.zsh $(zshrc)
	chsh -s $(shell which zsh)
endif
