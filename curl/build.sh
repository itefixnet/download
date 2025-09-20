#!/bin/bash
VERSION="curl-version"
bs_workspace="<folder>"

cd $bs_workspace
wget https://curl.se/download/curl-${VERSION}.tar.gz
tar xzvf curl-${VERSION}.tar.gz
cd curl-${VERSION}

./configure --prefix=/usr/local/curl --with-openssl --with-libssh2
make
make install

/usr/local/curl/bin/curl.exe --version
strip /usr/local/curl/bin/*

cp /usr/local/curl/bin/*.exe /usr/local/curl/bin/*.dll /bin
mkdir -p /usr/local/curl/etc/pki/tls/certs
cp /etc/pki/ca-trust/extracted/pem/tls-ca-bundle.pem /usr/local/curl/etc/pki/tls/certs/ca-bundle.crt

tar cvzf ../${bs_workspace}.tar.gz /usr/local/curl/bin/* /usr/local/curl/etc/*
