#!/bin/bash
touch ~/.sync/last_update
current=$(date +"%D")
lastupdate=$(cat ~/.sync/last_update)
if [ "$current" = "$lastupdate" ]
then
    exit 0
else
    cd ~/.sync
    git pull
    echo $current > ~/.sync/last_update
fi

