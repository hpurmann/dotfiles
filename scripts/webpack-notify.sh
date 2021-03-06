#!/bin/bash

strip_colors() {
    sed 's/\[[0-9;]*m//g' <<< $1
}

# read from stdin
while IFS= read -r LOGLINE;
do
    if [[ "${LOGLINE}" == "Hash: "* ]]
    then
        osascript -e 'display notification "'"$(strip_colors $LOGLINE)"'" with title "webpack log"'
    fi
    if [[ "${LOGLINE}" == *"ERROR in "* ]]
    then
        osascript -e 'display notification "'"$(strip_colors $LOGLINE)"'" with title "webpack log error"'
    fi
    echo "${LOGLINE}"
done
