[ -r ~/.bash_private ] && source ~/.bash_private

if [ -f ~/.git-prompt.sh ]; then
  source ~/.git-prompt.sh
fi
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi


export EDITOR="vim"

export LSCOLORS=cxBxhxDxfxhxhxhxhxcxcx
export CLICOLOR=1

# enable GIT prompt options
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
# i like my time in my prompt
export PROMPT_COMMAND='__git_ps1 "${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\[\033[1;33m\][\[\033[1;36m\]\t\[\033[1;33m\]]\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]" "\$ "'


export HISTCONTROL=ignoreboth:erasedups
export HISTFILE=~/.bash_history          # be explicit about file path
export HISTSIZE=100000                   # in memory history size
export HISTFILESIZE=100000               # on disk history size
export HISTTIMEFORMAT='%F %T '
shopt -s histappend # append to history, don't overwrite it
shopt -s cmdhist    # save multi line commands as one command

# Save multi-line commands to the history with embedded newlines
# instead of semicolons -- requries cmdhist to be on.
shopt -s lithist

