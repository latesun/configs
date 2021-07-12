tpm = $(HOME)/.tmux/plugins/tpm
zinit = $(HOME)/.zinit
zshrc = $(HOME)/.zshrc
hosts = /etc/hosts
raw = raw.githubusercontent.com

.PHONY: common.fasd
common.fasd:
	@echo "[INFO]: check fasd..."
ifeq (, $(shell type fasd))
	@cd /tmp && git clone --depth=1 https://github.com.cnpmjs.org/clvv/fasd.git
	@cd /tmp/fasd && sudo make install
	@echo "[INFO]: install fasd finished."
endif

.PHONY: common.tpm
common.tpm:
ifeq (, $(wildcard $(tpm)))
	git clone https://github.com.cnpmjs.org/tmux-plugins/tpm $(tpm)
	cp tmux.conf ~/.tmux.conf
endif

.PHONY: common.zinit
common.zinit:
ifeq (, $(wildcard $(zinit)))
	@echo "[INFO]: install zinit..."
	@mkdir $(zinit)
	git clone --depth=1 https://github.com.cnpmjs.org/zdharma/zinit.git $(zinit)/bin
	@echo "[INFO]: install zinit finished."
endif

.PHONY: github.host
github.host:
ifeq (, $(shell cat $(hosts) | grep $(raw)))
	echo "199.232.68.133  raw.githubusercontent.com" | sudo tee -a $(hosts)
endif
