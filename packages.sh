#!/bin/sh

packages="gkrellm aptitude texlive-full git emacs python-pip cpanplus
          cpanminus gnuplot-qt thunderbird konqueror konq-plugins
          libncurses-dev gfortran libpng-dev libgif-dev libjpeg8-dev
          pandoc moodbar highlight vlc valgrind autoconf cifs-utils
          gmtp keymon"

apt-get install $packages

