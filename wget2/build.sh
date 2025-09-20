#!/bin/bash
VERSION="wget2-version"
bs_workspace="folder"

cd $bs_workspace
wget https://ftp.gnu.org/gnu/wget/wget2-${VERSION}.tar.gz
tar xzvf wget2-${VERSION}.tar.gz

cd wget2-${VERSION}
./configure --prefix=/usr/local/wget2
make
make install

/usr/local/wget2/bin/wget2.exe --version

rm -f /usr/local/wget2/bin/wget2_noinstall.exe
strip /usr/local/wget2/bin/*
cp /usr/local/wget2/bin/*.exe /usr/local/wget2/bin/*.dll /bin
mkdir -p /usr/local/wget2/etc/pki/tls/certs
cp /etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem /usr/local/wget2/etc/ca-bundle.crt

tar cvzf ../${bs_workspace}.tar.gz /usr/local/wget2/bin/* /usr/local/wget2/etc/*
