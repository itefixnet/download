#!/bin/bash
VERSION="borgbackup-version"
bs_workspace="folder"

cd $bs_workspace
wget https://github.com/borgbackup/borg/archive/refs/tags/${VERSION}.tar.gz
tar xzvf ${VERSION}.tar.gz

cd borg-${VERSION}
pip3 install "borgbackup==${VERSION}"

borg --version

tar cvzf ../${bs_workspace}.tar.gz /usr/local/bin/borg /usr/local/bin/borgfs /usr/local/lib/python3.9/site-packages/borg* /usr/local/lib/python3.9/site-packages/msgpack*
