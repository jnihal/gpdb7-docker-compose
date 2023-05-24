#! /bin/bash

# Compile GPDB
if [ $1 != "rpm" ]; then
    docker exec -it gpdb7-docker-compose-cdw-1 /gpdb-scripts/compile-gpdb.sh
fi

# Install and prepare for GPDB
for host in cdw sdw1 sdw2 sdw3; do
    docker exec -it gpdb7-docker-compose-${host}-1 /gpdb-scripts/install-and-prep-for-gpdb.sh $1
done

# Create the GPDB cluster
docker exec -it gpdb7-docker-compose-cdw-1 /gpdb-scripts/create-gpdb-cluster.sh
