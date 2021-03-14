[ -r ~/.bash_private ] && source ~/.bash_private

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

export BASH_SILENCE_DEPRECATION_WARNING=1
export EDITOR="vim"

export LSCOLORS=cxBxhxDxfxhxhxhxhxcxcx
export CLICOLOR=1

export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export PROMPT_COMMAND='__git_ps1 "${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\033[1;33m\][\[\033[1;36m\]\t\[\033[1;33m\]]\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]" \<aws:\$AWS_PROFILE\>"\$ "'


export HISTCONTROL=ignoreboth:erasedups
export HISTFILE=~/.bash_history          # be explicit about file path
export HISTSIZE=100000                   # in memory history size
export HISTFILESIZE=100000               # on disk history size
export HISTTIMEFORMAT='%F %T '
shopt -s histappend 
shopt -s cmdhist 
shopt -s lithist

source <(kubectl completion bash)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


AE() {
  export AWS_PROFILE=$1
  export AWS_DEFAULT_PROFILE=$1
}

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
