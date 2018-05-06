#!/usr/bin/env bash

set -ex

sudo add-apt-repository ppa:jonathonf/texlive
sudo apt update
sudo apt install               \
     fonts-lmodern             \
     latex-beamer              \
     latex-xcolor              \
     latexmk                   \
     make                      \
     texlive-fonts-extra       \
     texlive-fonts-recommended \
     texlive-generic-extra     \
     texlive-latex-extra       \
     texlive-math-extra        \
     texlive-pictures          \
     texlive-science           \
     texlive-xetex

## Install Fira Fonts
wget -q https://github.com/mozilla/Fira/archive/4.202.zip
unzip -qq 4.202.zip
sudo mkdir -p /usr/share/fonts/opentype/Fira
sudo cp Fira*/otf/Fira* /usr/share/fonts/opentype/Fira/
sudo fc-cache -fv

## Install Metropolis theme
wget -q https://github.com/matze/mtheme/archive/master.zip
unzip -qq master.zip
(cd mtheme-master && make sty && make install)
