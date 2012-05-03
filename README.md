dotfiles
========

Personal account configuration

## do things ##

insert `(load-file  "~/dotfiles/emacs/myemacs.el")` into `~/.emacs`

## get things ##

 * Ack mode for emacs: https://github.com/jhelwig/ack-and-a-half
 * Themes for GKrellM: http://www.muhri.net/gkrellm/

## Solving problems ##

 * Git + proxy: see http://xzis.me/2012/02/git-with-proxy/
 * apt-get + proxy:  see http://askubuntu.com/questions/38823/how-to-use-apt-get-synaptic-behind-a-proxy

## machine specific ##

Make a file called, `~/.bash_local`.  It gets sourced from the
bashrc file.  Example from work at BNL:

    # -*- sh -*-
    bnlproxy
