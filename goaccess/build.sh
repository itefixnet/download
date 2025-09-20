#!/bin/bash
VERSION="goaccess-version"
bs_workspace="folder"

cd $bs_workspace
wget https://tar.goaccess.io/goaccess-${VERSION}.tar.gz
tar xzvf goaccess-${VERSION}.tar.gz

cd goaccess-${VERSION}
./configure  --sysconfdir=/etc --enable-utf8 --enable-geoip=legacy --with-openssl
make

./goaccess.exe --version
strip goaccess.exe

cat goaccess.1 | groff -mandoc -Thtml >goaccess.html

tar cvzf ../${bs_workspace}.tar.gz goaccess.exe goaccess.html config/*
