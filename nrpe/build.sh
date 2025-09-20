#!/bin/bash
VERSION"nrpe-version"
bs_workspace="folder"

cd $bs_workspace
wget https://github.com/NagiosEnterprises/nrpe/releases/download/nrpe-$VERSION/nrpe-$VERSION.tar.gz
tar xf nrpe-$VERSION.tar.gz

cd nrpe-$VERSION
./configure
make all

strip src/*.exe
src/nrpe --version
src/check_nrpe --version

tar cvzf ../${bs_workspace}.tar.gz SECURITY.md README.SSL.md src/*.exe
