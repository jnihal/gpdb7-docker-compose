#! /bin/bash
set -e

# Create data directories
mkdir -p /data/qddir && chown -R gpadmin:gpadmin /data/qddir

# Run gpinitsystem as gpadmin user
su gpadmin -c "
   # Run gpinitsystem
   cd /gpdb-scripts
   source /usr/local/greenplum-db/greenplum_path.sh
   gpinitsystem -a -c configs/clusterConfigFile -p configs/clusterConfigPostgresAddonsFile -h configs/hostfile
"

# Create environment file
cat > ~gpadmin/env.sh <<EOF
#! /bin/bash

source /usr/local/greenplum-db/greenplum_path.sh
export COORDINATOR_DATA_DIRECTORY=/data/qddir/gpseg-1
export PGPORT=7000

EOF
