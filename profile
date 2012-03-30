
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

source ~/.git-completion.bash

apps_variedades=([0]='programa' 
      [1]='plantao'
      [2]='quadros'
      [3]='enquete_variedades'
      [4]='teste_personalidade_variedades'
      [5]='apresentador'
      [6]='materia_variedades'
      [7]='galeria_variedades'
      [8]='menu_variedades'
      [9]='comum_variedades'
      [10]='participantes')

apps_entretenimento=([0]='seo'
      [1]='enquetemultimidia'
      [2]='teste_personalidade')

function digivolve_para(){
    pushd ~/projects/
    echo "### APPS VARIEDADES ###"
    for i in ${apps_variedades[@]}
    do
        echo "### ${i} ###"
        cd ~/projects/variedades/${i} && 
        git checkout $1
        echo
    done  
    echo "### APPS NÃO VARIEDADES ###"
    for i in ${apps_entretenimento[@]}
    do
        echo "### ${i} ###"
        cd ~/projects/${i} && 
        git checkout $1
        echo
    done
    popd
}

function genkidama(){
    workon $1
    pushd ~/projects/
    echo "### APPS VARIEDADES ###"
    for i in ${apps_variedades[@]}
    do
        echo "### ${i} ###"
        cd ~/projects/variedades/${i} && pip install -e . --no-deps
        echo        
    done  
    echo "### APPS NÃO VARIEDADES ###"
    for i in ${apps_entretenimento[@]}
    do
        echo "### ${i} ###"
        cd ~/projects/${i} && pip install -e . --no-deps
        echo        
    done  
    popd
}

function power_of_destruction(){
    workon $1
    pushd ~/projects/
    echo "### APPS VARIEDADES ###"
    for i in ${apps_variedades[@]}
    do
        echo "### ${i} ###"
        pip uninstall ${i} -y
        echo        
    done     
    echo "### APPS NÃO VARIEDADES ###"
    for i in ${apps_entretenimento[@]}
    do
        echo "### ${i} ###"
        pip uninstall ${i} -y
        echo        
    done  
    popd
}

function get_over_here(){
    pushd ~/projects/
    echo "### APPS VARIEDADES ###"
    for i in ${apps_variedades[@]}
    do
        echo "### ${i} ###"
        cd ~/projects/variedades/${i} && 
        git branch &&
        git pull
        echo        
    done
    echo "### APPS NÃO VARIEDADES ###"
    for i in ${apps_entretenimento[@]}
    do
        echo "### ${i} ###"
        cd ~/projects/${i} && 
        git branch &&
        git pull
        echo        
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

[[ -s "/Users/hugo/.rvm/scripts/rvm" ]] && source "/Users/hugo/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
