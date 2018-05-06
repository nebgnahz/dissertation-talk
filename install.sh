#!/usr/bin/env bash

set -ex

# See if there is a cached version of TL available
export TEXPATH=/tmp/texlive/bin/x86_64-linux
export PATH=$TEXPATH:$PATH

## Install Fira Fonts
if [ ! -d $HOME/.fonts ]; then
  wget -q https://github.com/mozilla/Fira/archive/4.202.zip
  unzip -qq 4.202.zip
  mkdir -p $HOME/.fonts
  cp Fira*/otf/Fira* $HOME/.fonts
fi

if ! command -v xetex > /dev/null; then
  # Obtain TeX Live
  wget -q http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*

  # Install a minimal system
  ./install-tl --profile=../.texlive.profile

  cd ..

  # list: http://ctan.mirrors.hoobly.com/systems/texlive/tlnet/archive/
  tlmgr install \
        appendixnumberbeamer \
        beamer \
        beamertheme-metropolis \
        booktabs \
        caption \
        collection-fontsextra \
        collection-fontsrecommended \
        collection-mathscience \
        collection-pictures \
        collection-xetex \
        etoolbox \
        fancyvrb \
        fontspec \
        listings \
        mathtools \
        microtype \
        multirow \
        scheme-xetex \
        shapepar \
        translator \
        xkeyval

  # Update the TL install but add nothing new
  tlmgr update --self --all --no-auto-install

  # Keep no backups (not required, simply makes cache bigger)
  tlmgr option -- autobackup 0

  ## Install latexmk
  wget http://mirrors.ctan.org/support/latexmk.zip
  unzip latexmk.zip
  cp latexmk/latexmk.pl $TEXPATH/latexmk
fi

## Install Metropolis theme
# wget -q https://github.com/matze/mtheme/archive/master.zip
# unzip -qq master.zip
# (cd mtheme-master && make sty && make install)
