#!/bin/bash
VERSION="logrotate-version"
bs_workspace="folder"

cd $bs_workspace
wget https://github.com/logrotate/logrotate/releases/download/$VERSION/logrotate-$VERSION.tar.gz
tar xf logrotate-${VERSION}.tar.gz

cd logrotate-${VERSION}
./configure --with-acl=no
make

strip logrotate.exe
./logrotate --version
cat logrotate.8 | groff -mandoc -Thtml >logrotate.html

tar cvzf ../${bs_workspace}.tar.gz logrotate.exe logrotate.html
