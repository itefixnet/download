#!/bin/bash
VERSION="openssh-version"
bs_workspace="folder"

cd $bs_workspace
wget https://ftp.hostserver.de/pub/OpenBSD/OpenSSH/portable/openssh-${VERSION}.tar.gz
tar xzf openssh-${VERSION}.tar.gz

cd openssh-${VERSION}
patch  < ../openssh_override_bad_ownership_root.patch
./configure --prefix=/usr --sysconfdir=/etc --libexecdir='\${sbindir}' --localstatedir=/var --datadir='\${prefix}/share' --mandir='\${datadir}/man' --infodir='\${datadir}/info'
make

strip *.exe

tar cvzf ../${bs_workspace}.tar.gz scp.exe sftp.exe sftp-server.exe ssh.exe ssh-add.exe ssh-agent.exe sshd.exe sshd-session.exe sshd-auth.exe ssh-keygen.exe ssh-keyscan.exe ssh-keysign.exe ssh-pkcs11-helper.exe moduli sshd_config ssh_config

./ssh -V
