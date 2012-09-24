# -*- sh -*-

## Install https://github.com/sorin-ionescu/prezto

## edit ~/.zprezto/modules/utility/init.zsh at line 64 to add -F

# For
#   Failed to load module "canberra-gtk-moduleanberra-gtk-module" 
# See comment #8 at
#   https://bugs.launchpad.net/ubuntu/+source/libcanberra/+bug/888779

############################################################################
## Environment variables needed to play nicely with perl and latex tools
############################################################################
export PERL5LIB=$HOME/perl
#export PERL5OPT="-I$HOME/git/demeter/lib -I$HOME/git/XAS-Data-Interchange/perl/lib -I$HOME/git/XAS-Data-Interchange/perl/blib/arch -I/$HOME/git/BLA-XANES/lib"
export PERL5OPT="-I$HOME/git/demeter/lib -I/$HOME/git/BLA-XANES/lib"

export TEXINPUTS=".:$HOME/TeX/XAS-Education/sty/:$HOME/TeX/sty//:"
export BSTINPUTS=".:$HOME/TeX/XAS-Education/sty/:$HOME/TeX/sty//:"
export BIBINPUTS=".:$HOME/TeX/XAS-Education/sty/:$HOME/TeX/sty//:"

path=($path $HOME/bin/)


############################################################################
## aliases I use
############################################################################
alias bnlproxy='export http_proxy=http://192.168.1.130:3128 && export ftp_proxy=$http_proxy'
alias noproxy='export http_proxy=  && export ftp_proxy=$http_proxy'

alias ecb="emacs -geometry 227x64+0+0 -font 7x14 -f ecb-activate"
alias upgrade="sudo apt-get update && sudo apt-get upgrade"

alias acknh="ack --type=nohtml"
