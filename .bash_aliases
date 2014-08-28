# ENV
alias vim="mvim -v"

export EDITOR='vim'
export VISUAL='vim -f'
export PAGER=less

alias vi=vim
alias emacs="emacs -nw"

alias targz="tar -zcvf" # archive-name.tar.gz directory-name

# Using coreutils on OSX
alias ls='ls --color=always'
alias la='ls -la'
alias grep='grep --color=always'
alias egrep='egrep --color=always'
alias c='clear'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias rad='screen -rad'
alias pls='fc -s | less'
alias zshup='source ~/.zshrc; echo ".zshrc sourced"'
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

# Postgres
alias start_pg='postgres -D /usr/local/var/postgre'
