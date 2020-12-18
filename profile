export TM_PYCHECKER=pyflakes

export EDITOR=vim
export CLICOLOR="auto"
export GREP_COLOR="4;33"
export GREP_OPTIONS="--color=auto"

export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:$PATH
export PATH=/usr/local/Cellar/mysql/bin:$PATH
# ruby stuff
export PATH=/usr/local/Cellar/ruby/1.9.1-p378/bin:$PATH
export PATH=$HOME/.gem/ruby/1.9.1/bin:$PATH

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

alias ll="ls -l"
alias la="ls -la"
alias ls="ls -G"
alias sobe_ipypi="python setup.py sdist upload -r ipypi-local"
alias sobe_pypi="python setup.py sdist upload -r pypi-local"

alias egrep="egrep --colour"
alias grep="egrep --colour"

#path do BREW
PATH_BREW=/usr/local/Cellar/

# git
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"

PS1="\$LIGHT_GRAY[$GREEN\u@\h:\W$LIGHT_GRAY]$RED\$(parse_git_branch)$WHITE\$ "
PS2='> '
PS4='+ '
}
proml

# # source ~/.git-completion.bash

#RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -s "/Users/hugo/.rvm/scripts/rvm" ]] && source "/Users/hugo/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

alias kill_hideme="sudo killall -HUP mDNSResponder && sudo pfctl -F all -f ~/Library/Application\ Support/me.hide.macapp/pf.hide.me.conf"

eval "$(pyenv init -)"
# eval "$(pipenv --completion)"
alias prun="pipenv run"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

export PATH="$HOME/.poetry/bin:$PATH"
