#  1. Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## 1.1. Key bindings
bindkey "^a" autosuggest-accept
bindkey "^p" history-substring-search-up
bindkey "^n" history-substring-search-down

#  2. Environment args
## 2.1. Default editor
export EDITOR=nvim

## 2.2. Go
export GOPATH=$HOME/workspaces/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

## 2.3. Rust
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
export CARGOBIN=$HOME/.cargo/bin
export PATH=$PATH:$CARGOBIN

## 2.4. Local bin
export PATH=$PATH:$HOME/.local/bin

## 2.6. History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
export FUNCNEST=10000

# 3. Init
## 3.1. Prompt
eval "$(starship init zsh)"

## 3.2. Smarter cd
eval "$(zoxide init zsh)"

## 3.3. fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## 3.4. fnm
eval "$(fnm env --use-on-cd)"

## 3.5. pyenv
alias brew='env PATH="${PATH//$(pyenv root)\/shims:/}" brew'
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#  4. Shortcuts
## 4.1. Common
alias c=clear
alias jq=gojq
alias md=glow
alias vi=nvim
alias vim=nvim
alias lg=lazygit
alias btm="btm --color gruvbox"
alias ls="exa --icons"
alias ll="exa -alh --icons"
alias tree="exa -T --icons"
alias py=ipython
alias sk="sk --preview='bat {} --color=always'"
alias tidy="go mod tidy"
alias init="go mod init"
alias compose="docker compose"

## 4.2. kubectl get resource
alias kubectl="kubecolor"
alias k="kubecolor"
alias kn="kubectl get nodes -o wide"
alias kp="kubectl get pods -o wide"
alias kd="kubectl get deployment -o wide"
alias ks="kubectl get svc -o wide"

## 4.3. kubectl describe resources
alias kdp="kubectl describe pod"
alias kdd="kubectl describe deployment"
alias kds="kubectl describe service"
alias kdn="kubectl describe node"

## 4.4. Customize
alias mgo-dev="mongo admin -u user -p password --host 127.0.0.1:27017"
alias rds-dev="redis-cli -h 127.0.0.1 -p 6379 -a password"

#  5. Customize Functions
