#!/bin/bash

set -e
DIR="$(pwd)"

source docker-helper.sh
docker-compose build
dnpm install
docker-compose up --force-recreate
