#!/bin/bash

set -e

source docker-helper.sh
docker-compose build
dinstall
docker-compose up --force-recreate
