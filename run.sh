#!/bin/sh
echo "RUST > Checking Docker's instances for RustPostgreSQL";

DOCKER_ID=$(docker ps -aqf "name=RustPostgreSQL");
echo "$DOCKER_ID";
if [[ -z "$DOCKER_ID" ]]; then 
	echo "RUST > Docker container is NOT running.";
	echo "RUST > Executing.";

else 
	echo "RUST > Container is up and running";
	echo "RUST > Stopping.";
	docker rm -f $DOCKER_ID;
	echo "RUST > Sttoped. Executing a new one."
fi

docker-compose up;