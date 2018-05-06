#!/usr/bin/env bash

set -ex

# See if there is a cached version of TL available
export PATH=/tmp/texlive/bin/x86_64-linux:$PATH
if ! command -v xetex > /dev/null; then
  # Obtain TeX Live
  wget -q http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
  tar -xzf install-tl-unx.tar.gz
  cd install-tl-20*

  # Install a minimal system
  ./install-tl --profile=.texlive.profile

  cd ..
fi

# Update the TL install but add nothing new
tlmgr update --self --all --no-auto-install

# Keep no backups (not required, simply makes cache bigger)
tlmgr option -- autobackup 0

# Just including xetex so the cache check above works
# Needed for any use of xetex even if not testing XeTeX
tlmgr install xetex

# Needed for TeX Live 2017
tlmgr install xkeyval

# A kind of minimum set of packages needed
tlmgr install collection-latex

# Install babel languages
tlmgr install collection-langeuropean

# Index of packages: http://ctan.mirrors.hoobly.com/systems/texlive/tlnet/archive/
# Other contrib packages: done as a block to avoid multiple calls to tlmgr
# pgf includes tikz
tlmgr install   \
  exam          \
  amsmath       \
  amsthm        \
  amssymb       \
  mathtools     \
  enumerate     \
  thmtools      \
  stmaryrd      \
  xcolor        \
  pdfpages      \
  centernot     \
  pgf           \
  cancel        \
  hyperref      \
  bookmark      \
  pgfplots      \
  bm            \
  listings      \
  graphicx      \
  scalerel      \
  stackengine   \
  etoolbox      \
  listofitems   \
  marvosym      \
  amsfonts      \
  opensans      \
  slantsc       \
  fancyhdr      \
  ulem          \
  algorithms    \
  algorithmicx  \
  float         \
  booktabs      \
  enumitem      \
  polynom       \
  fancyvrb      \
  makecmds      \
  multirow      \
  chngcntr      \
  imakeidx

## Install Fira Fonts
wget -q https://github.com/mozilla/Fira/archive/4.202.zip
unzip -qq 4.202.zip
sudo mkdir -p /usr/share/fonts/opentype/Fira
sudo cp Fira*/otf/Fira* /usr/share/fonts/opentype/Fira/
sudo fc-cache -fv

## Install Metropolis theme
- wget -q https://github.com/matze/mtheme/archive/master.zip
- unzip -qq master.zip
- (cd mtheme-master && make sty && make install)
