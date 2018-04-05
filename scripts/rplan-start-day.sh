#!/bin/bash

set -e

source docker-helper.sh
docker-compose build
dyarn install --force
docker-compose up --force-recreate
