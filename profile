export VERSIONER_PYTHON_PREFER_32_BIT=yes
export TM_PYCHECKER=pyflakes
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python

# virtualenv wrapper configuration
export WORKON_HOME=$HOME/envs
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    . /usr/local/bin/virtualenvwrapper.sh
fi

export EDITOR=vim
export CLICOLOR="auto"
export GREP_COLOR="4;33"
export GREP_OPTIONS="--color=auto"

#lib mysql
#export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:$PATH
export PATH=/usr/local/Cellar/mysql/bin:$PATH
# ruby stuff
export PATH=/usr/local/Cellar/ruby/1.9.1-p378/bin:$PATH
export PATH=$HOME/.gem/ruby/1.9.1/bin:$PATH

# postgres
export PATH=/Library/PostgreSQL/9.1/bin/$PATH
export PGDATA=/usr/local/var/postgres/

function start_postgres(){
    pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
}
function stop_postgres(){
    pg_ctl -D /usr/local/var/postgres stop -s -m fast
}

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

#mysql
function start_mysql {
    mysql.server stop || true
    diskutil erasevolume HFS+ 'ramdisk' `hdiutil attach -nomount ram://1165430`
    mysql_install_db --datadir=/Volumes/ramdisk --basedir=`brew --prefix mysql`
    mysql.server start --datadir=/Volumes/ramdisk
    #mysql -u root -e "create database novelas;create database novelas_test;"
    #to cagando se a proxima linha der erro pq eh quando o arquivo nao existe
    #mysql -u root novelas < .dump-novelas.sql || true
}

function stop_mysql {
    mysqldump --datadir=/Volumes/ramdisk -u root novelas > .dump-novelas.sql || true
    mysql.server stop || true
    diskutil unmountDisk "ramdisk"
}

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

source ~/.git-completion.bash

alias virtuoso_start="cd /usr/local/Cellar/virtuoso/6.1.7/var/lib/virtuoso/db/ && sudo virtuoso-t -f"
export VIRTUOSO_HOME=/usr/local/Cellar/virtuoso/6.1.7

#RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -s "/Users/hugo/.rvm/scripts/rvm" ]] && source "/Users/hugo/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting