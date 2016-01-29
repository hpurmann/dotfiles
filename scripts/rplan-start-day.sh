#!/bin/bash

set -e
DIR="$(pwd)"

docker-machine restart default
source docker-helper.sh default
docker-compose build
dnpm install
docker-compose up --force-recreate
