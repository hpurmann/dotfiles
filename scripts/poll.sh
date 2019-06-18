#!/bin/bash

count=0;
while true;
do
    count=$((count + 1));
    $@ ;
    echo $count;
    sleep 1;
done

