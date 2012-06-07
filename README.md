dotfiles
========

Personal account configuration

## do things ##

insert `(load-file  "~/dotfiles/emacs/myemacs.el")` into `~/.emacs`

Using Amarok's moodbar: http://userbase.kde.org/Amarok/Manual/Various/Moodbar
also need to install `moodbar` package.

## get things ##

 * Ack mode for emacs: https://github.com/jhelwig/ack-and-a-half
 * tangotango color mode for Emacs: https://github.com/juba/color-theme-tangotango
 * Themes for GKrellM: http://www.muhri.net/gkrellm/

## Solving problems ##

 * Git + proxy: see http://xzis.me/2012/02/git-with-proxy/
 * apt-get + proxy:  see http://askubuntu.com/questions/38823/how-to-use-apt-get-synaptic-behind-a-proxy
 * permission denied when using locate:
     sudo chgrp mlocate /usr/bin/mlocate 
     sudo chmod g+s /usr/bin/mlocate

## machine specific ##

Make a file called, `~/.bash_local`.  It gets sourced from the
bashrc file.  Example from work at BNL:

    # -*- sh -*-
    bnlproxy
