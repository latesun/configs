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
	brew install kubectl
	@echo "[INFO]: install kubectl finished."
endif
ifeq (, $(shell type kubecolor))
	@echo "[INFO]: install kubecolor..."
	brew install dty1er/tap/kubecolor
	@echo "[INFO]: install kubecolor finished."
endif
ifeq (, $(shell type tldr))
	@echo "[INFO]: install tealdeer..."
	brew install tealdeer
	@echo "[INFO]: install tealdeer finished."
endif
ifeq (, $(shell type lazygit))
	@echo "[INFO]: install lazygit..."
	brew install lazygit
	@echo "[INFO]: install lazygit finished."
endif
ifeq (, $(shell type highlight))
	@echo "[INFO]: install highlight..."
	brew install highlight
	@echo "[INFO]: install highlight finished."
endif

.PHONY: mac.nvim
mac.nvim: vim.full
ifeq (, $(shell type node))
	@echo "[INFO]: install nodejs..."
	brew install nodejs
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
mac.zsh: common.zinit
ifeq (, $(shell type zsh))
	@echo "[INFO]: install zsh..."
	brew install --HEAD zsh
	@echo "[INFO]: install zsh finished."
endif
ifeq (, $(wildcard $(zshrc)))
	cp zsh/mac.zsh $(zshrc)
	chsh -s $(shell which zsh)
endif

.PHONY: mac.dbs
mac.dbs:
ifeq (, $(shell type redis))
	@echo "[INFO]: install redis..."
	brew install redis
	brew services start redis
	@echo "[INFO]: install redis finished."
endif
ifeq (, $(shell type pgcli))
	@echo "[INFO]: install postgresql..."
	brew install postgresql pgcli
	brew services start postgresql
	@echo "[INFO]: install postgresql finished."
endif
