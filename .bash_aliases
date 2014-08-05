# ENV
alias vim="mvim -v"

export EDITOR='vim'
export VISUAL='vim -f'
export PAGER=less

alias vi=vim
alias emacs="emacs -nw"

alias targz="tar -zcvf" # archive-name.tar.gz directory-name

# Unix
alias ls='ls -G'
alias la='ls -la'
alias grep='grep --exclude="*.svn*"'
alias c='clear'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias rad='screen -rad'
alias pls='fc -s | less'
alias bashup='source ~/.bashrc; echo ".bashrc updated"'
alias tnew='tmux new -s'
alias tad='tmux attach -d -t'
alias tls='tmux ls'


# virtualenv aliases
alias v='workon'
alias v.deactivate='deactivate'
alias v.mk='mkvirtualenv --no-site-packages'
alias v.mk_withsitepackages='mkvirtualenv'
alias v.rm='rmvirtualenv'
alias v.switch='workon'
alias v.add2virtualenv='add2virtualenv'
alias v.cdsitepackages='cdsitepackages'
alias v.cd='cdvirtualenv'
alias v.lssitepackages='lssitepackages'

function setjdk {
  local ver=${1?Usage: setjdk <version>}
  export JAVA_HOME=$(/usr/libexec/java_home -v $ver)
  PATH=$(echo $PATH | tr ':' '\n' | grep -v Java | tr '\n' ':')
  export PATH=$JAVA_HOME/bin:$PATH
}
function _setjdk_completion (){
  COMPREPLY=()

  local cur=${COMP_WORDS[COMP_CWORD]//\\/}
  local options=$(/usr/libexec/java_home -x | plutil -convert json -r -o - - | grep JVMVersion | sed 's/[^:]*[^"]*"\([^"]*\).*//')
  COMPREPLY=($(compgen -W "${options}" ${cur}))
}
complete -F _setjdk_completion -o filenames setjdk

# set TERM to 'sscreen' when SSHing
alias ssh='TERM=screen ssh'
