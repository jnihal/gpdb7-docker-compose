#! /bin/bash

yum install -y epel-release
yum install -y emacs-nox net-tools openssh-server openssh-clients python3-devel
yum install -y python3-pip

pip3 install psutil==5.7.0 pyyaml==5.3.1

wget https://go.dev/dl/go1.18.3.linux-amd64.tar.gz
tar -C /usr/local -xzvf go1.18.3.linux-amd64.tar.gz
rm -f go1.18.3.linux-amd64.tar.gz
