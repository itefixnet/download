#!/bin/bash
VERSION="rbldnsd-version"
bs_workspace="folder"

cd $bs_workspace
wget https://github.com/spamhaus/rbldnsd/archive/refs/tags/${VERSION}.tar.gz

tar zxf ${VERSION}.tar.gz

cd rbldnsd-$1
./configure
make

strip rbldnsd.exe
cat rbldnsd.8 | groff -mandoc -Thtml >rbldnsd.html

./rbldnsd -h

tar cvzf ../${bs_workspace}.tar.gz rbldnsd.exe rbldnsd.html
