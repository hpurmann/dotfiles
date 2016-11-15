#!/bin/bash

set -e

source docker-helper.sh
docker-compose build
dnpm install
docker-compose up --force-recreate
