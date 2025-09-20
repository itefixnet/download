#!/bin/bash
VERSION="tmux-version"
bs_workspace="folder"

cd $bs_workspace
wget https://github.com/tmux/tmux/releases/download/3.5a/tmux-${VERSION}.tar.gz
tar zxf ${VERSION}.tar.gz

cd tmux-$1
./configure
make

strip tmux.exe

./tmux -V

tar cvzf ../${bs_workspace}.tar.gz tmux.exe
