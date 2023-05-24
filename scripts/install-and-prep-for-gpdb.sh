#! /bin/bash
set -e

# Install GPDB
if [ $1 == "rpm" ]; then
    yum -y install /gpdb-rpm/greenplum-db-*.rpm
    chown -R gpadmin:gpadmin /usr/local/greenplum-db-*
else
    cd /gpdb-src
    make install
fi

# Source GPDB and install pygresql
source /usr/local/greenplum-db/greenplum_path.sh
pip3 install pygresql

# Start sshd server
/usr/sbin/sshd

mkdir -p /data/primary /data/mirror && chown -R gpadmin:gpadmin /data/primary /data/mirror
