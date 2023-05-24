#! /bin/bash

# Compile GPDB
if [ $1 != "rpm" ]; then
    podman exec -it gpdb7-docker-compose_cdw_1 /gpdb-scripts/compile-gpdb.sh
fi

# Install and prepare for GPDB
for host in cdw sdw1 sdw2 sdw3; do
    podman exec -it gpdb7-docker-compose_${host}_1 /gpdb-scripts/install-and-prep-for-gpdb.sh $1
done

# Create the GPDB cluster
podman exec -it gpdb7-docker-compose_cdw_1 /gpdb-scripts/create-gpdb-cluster.sh
