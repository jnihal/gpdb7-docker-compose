#! /bin/bash
set -e

BUILD=${1:-"source"}

if [ $BUILD != "rpm" ] && [ $BUILD != "source" ]; then
    echo "Invalid argument: $BUILD"
    exit 1
fi

# Compile GPDB
if [ $BUILD == "source" ]; then
    docker exec -it gpdb7-docker-compose-cdw-1 /gpdb-scripts/compile-gpdb.sh
fi

# Install and prepare for GPDB
for host in cdw sdw1 sdw2 sdw3; do
    docker exec -it gpdb7-docker-compose-${host}-1 /gpdb-scripts/install-and-prep-for-gpdb.sh $BUILD
done

# Create the GPDB cluster
docker exec -it gpdb7-docker-compose-cdw-1 /gpdb-scripts/create-gpdb-cluster.sh
