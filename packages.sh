#!/bin/sh

packages="gkrellm aptitude texlive-full git emacs python-pip libcpanplus-perl
          cpanminus gnuplot-qt thunderbird konqueror konq-plugins
          libncurses5-dev gfortran libgif-dev libjpeg8-dev
          pandoc highlight vlc valgrind autoconf cifs-utils
          gmtp keymon perl-doc
          greybird-gtk-theme human-theme numix-gtk-theme
          ttf-mscorefonts-installer inkscape unoconv texlive-latex-recommended
          auctex texlive-extra-utils
          pdftk scons swig libx11-dev libwx-perl python-nose key-mon
          python-pystache gimp kcron calibre pdf2djvu"

## deprecated
#  albatross-gtk-theme bluebird-gtk-theme moodbar  orion-gtk-theme libpng12

apt-get install $packages

