#postgres
#export PGDATA=/usr/local/var/postgres/

export PYTHONSTARTUP=$HOME/.pythonstartup 
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

export PATH=/usr/local/sbin/:/usr/local/bin:/usr/bin/:$PATH
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

alias egrep="egrep --colour"
alias grep="egrep --colour"

#path do BREW
PATH_BREW=/usr/local/Cellar/
#export PATH=$PATH_BREW/python/2.6.5/bin:$PATH_BREW/postgresql/8.4.3/bin/:$PATH

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

apps=([0]='programa' 
      [1]='plantao'
      [2]='quadros'
      [3]='enquete_variedades'
      [4]='teste_personalidade_variedades'
      [5]='seo'
      [6]='apresentador'
      [7]='teste_personalidade'
      [8]='enquetemultimidia'
      [9]='materia_variedades'
      [10]='galeria_variedades'
      [11]='menu_variedades'
      [12]='comum_variedades')

function genkidama(){
    workon $1
    pushd ~/projects/
    for i in ${apps[@]}
    do
        echo "### ${i} ###"
        cd ~/projects/${i} && pip install -e . --no-deps
    done  
    popd
}

function power_of_destruction(){
    workon $1
    pushd ~/projects/
    for i in ${apps[@]}
    do
        echo "### ${i} ###"
        pip uninstall ${i}
    done  
    popd
}

function get_over_here(){
    pushd ~/projects/
    for i in ${apps[@]}
    do
        echo "### ${i} ###"
        cd ~/projects/${i} && git pull
    done
    popd
}


function stop_busca(){
    pushd ~/projects/barramento/ && make stop &&
    cd ~/projects/busca-nova-plataforma/ && make stop &&
    popd
}


function start_busca(){
    pushd ~/projects/barramento/ && make start &&
    cd ~/projects/busca-nova-plataforma/ && make start &&
    popd
}

function status_busca(){
    pushd ~/projects/barramento/ && make status &&
    echo "solr"
    cd ~/projects/busca-nova-plataforma/ && make status &&
    popd
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
