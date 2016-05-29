#!/bin/bash

global_modules=(
    'eslint-cli'
    'livedown'
)

count=0
while [ "x${global_modules[count]}" != "x" ]
do
    npm install -g ${global_modules[count]}
    count=$(( $count + 1 ))
done
