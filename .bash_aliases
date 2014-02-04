# ENV
export EDITOR=vim
export VISUAL=vim
export PAGER=less

alias mutt="mutt -y"
alias vi="vim"
alias emacs="emacs -nw"

alias targz="tar -zcvf" # archive-name.tar.gz directory-name

# Unix
#alias less='less -F -r'
alias less='less -r'
alias la='ls -la'
alias sl='ls'
function __mkmaildir {
    if [ "$1x" != 'x' ]; then
        mkdir -p $HOME/mail/$1/{cur,new,tmp}
    fi
}
alias mkmaildir='__mkmaildir'
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

# Blueprint Aliases
alias bpscdb='psql -d suitcase_db'
