# p10k setup
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


[ -r ~/.zsh_private ] && source ~/.zsh_private
[ -r ~/.git.zsh ] && source ~/.git.zsh

autoload -U compinit && compinit

setopt AUTO_LIST
setopt LIST_PACKED

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:default' menu select=1

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

setopt PROMPT_SUBST
setopt PROMPT_PERCENT
setopt TRANSIENT_RPROMPT
setopt AUTO_CD
setopt AUTO_PUSHD
setopt CORRECT
setopt INTERACTIVE_COMMENTS

export PATH=$HOME/go/bin:$PATH

export EDITOR='vim'
export GOPATH=${HOME}/go

eval "$(direnv hook zsh)"
source <(stern --completion=zsh)
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

