# -*- sh -*-
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignorespace:erasedups
# ... and ignore same sucessive entries.
#export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

if [ -f ~/perl5/perlbrew/etc/bashrc ]; then
    . ~/perl5/perlbrew/etc/bashrc
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto --group-directories-first'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'
alias df='df -h'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


## my modifications
export PERL5LIB=$HOME/perl
#export PERL5OPT="-I$HOME/git/demeter/lib -I$HOME/git/XAS-Data-Interchange/perl/lib -I$HOME/git/XAS-Data-Interchange/perl/blib/arch -I/$HOME/git/BLA-XANES/lib"
export PERL5OPT="-I$HOME/git/demeter/lib -I/$HOME/git/BLA-XANES/lib"
export PAGER=less
export PATH=~/bin:$PATH
export TEXINPUTS=".:$HOME/TeX/XAS-Education/sty//:$HOME/TeX/writing/sty//:$HOME/TeX/sty//:"
export BSTINPUTS=".:$HOME/TeX/XAS-Education/sty//:$HOME/TeX/writing/sty//:$HOME/TeX/sty//:"
export BIBINPUTS=".:$HOME/TeX/XAS-Education/sty//:$HOME/TeX/writing/sty//:$HOME/TeX/sty//:"

## syntax highlight and piping through less, -R = pass raw control characters
#command -v highlight >/dev/null 2>&1 && {
if command_exists highlight; then
   export HIGHLIGHT_STYLE="moria"
   export LESSOPEN='| highlight -q --out-format=xterm256 --style=$HIGHLIGHT_STYLE %s'
   export LESS=' -R '
   alias ccat="highlight -q --out-format=xterm256 --style=$HIGHLIGHT_STYLE"
fi

alias bnlproxy='export http_proxy=http://192.168.1.130:3128 && export https_proxy=$http_proxy && export ftp_proxy=$http_proxy'
alias noproxy='export http_proxy=  &&  export https_proxy=$http_proxy && export ftp_proxy=$http_proxy'

#alias emacs='GDK_NATIVE_WINDOWS=1 emacs'
alias ecb="emacs -geometry 227x64+0+0 -font 7x14 -f ecb-activate"
alias xemacs="xemacs -bg lemonchiffon3"
alias rm="rm -i"
alias pu=~/bin/purge
alias m=make
alias o=xdg-open
alias upgrade="sudo apt-get update && sudo apt-get upgrade"

alias acknh="ack --type=nohtml"

alias xo='xdg-open'
alias gitup="git fetch upstream && git merge upstream/master"
alias ssha='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa'

alias vg='valgrind --track-origins=yes --leak-check=full --show-leak-kinds=all'
alias pssp='pushd; scons; sudo scons install; pushd'

unalias ls
eval `dircolors -b ~/.dir_colors`
alias ls='env LC_ALL=C ls -F --color=auto --group-directories-first'

complete -f -X '!*.@(pl|t|PL)' perl
complete -f -X '!*.prj' athena
complete -f -X '!*.inp' atoms
complete -f -X '!*.@(apj|prj|inp)' artemis

if [ -f ~/.bash_local ]; then
    . ~/.bash_local
fi
if [ -f ~/.bash_local-lib ]; then
    . ~/.bash_local-lib
fi
if [ -f ~/.bash.local-lib ]; then
    . ~/.bash.local-lib
fi


prompt

