dotfiles
========

Personal account configuration

## do things ##

insert `(load-file  "~/dotfiles/emacs/myemacs.el")` into `~/.emacs`

Using Amarok's moodbar: http://userbase.kde.org/Amarok/Manual/Various/Moodbar
also need to install `moodbar` package.

[git push to multiple remote repos](http://blog.lckymn.com/2013/03/11/git-push-to-pull-from-both-github-and-bitbucket/)

## get things ##

 * Latest ECB: https://github.com/ecb-home/ecb (clone into ~/dotfiles/emacs, byte-compile)
 * Ack mode for emacs: https://github.com/jhelwig/ack-and-a-half
 * tangotango color mode for Emacs: https://github.com/juba/color-theme-tangotango
 * Themes for GKrellM: http://www.muhri.net/gkrellm/
 * Highlight (package `highlight` via apt-get or http://www.andre-simon.de/)
 * perlbrew : https://metacpan.org/pod/App::perlbrew (with curl via apt-get)
 * git aware prompt: https://github.com/jimeh/git-aware-prompt

### deprecated ###

 * Zsh (`apt-get install zsh zsh-doc zsh-lovers`) + Prezto: https://github.com/sorin-ionescu/prezto


## Solving problems ##

 * Git + proxy: see http://xzis.me/2012/02/git-with-proxy/
 * apt-get + proxy:  see http://askubuntu.com/questions/38823/how-to-use-apt-get-synaptic-behind-a-proxy
 * permission denied when using locate:
     sudo chgrp mlocate /usr/bin/mlocate 
     sudo chmod g+s /usr/bin/mlocate
 * mounting filesystems via CIFS: `sec=ntlm` is an essential parameter

## machine specific ##

Make a file called, `~/.bash_local`.  It gets sourced from the
bashrc file.  Example from work at BNL:

    # -*- sh -*-
    bnlproxy
