#!/bin/bash

set -e

source docker-helper.sh
docker-compose build
dyarn install
docker-compose up --force-recreate
