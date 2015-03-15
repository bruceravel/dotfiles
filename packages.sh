#!/bin/sh

packages="gkrellm aptitude texlive-full git emacs python-pip cpanplus
          cpanminus gnuplot-qt thunderbird konqueror konq-plugins
          libncurses-dev gfortran libpng-dev libgif-dev libjpeg8-dev
          pandoc moodbar highlight vlc valgrind autoconf cifs-utils
          gmtp keymon perl-doc albatross-gtk-theme bluebird-gtk-theme
          greybird-gtk-theme human-gtk-theme numix-gtk-theme orion-gtk-theme
          ttf-mscorefonts-installer inkscape unoconv latex-beamer auctex"

apt-get install $packages

