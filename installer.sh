#!/bin/bash
mkdir -p .sync
git clone git@github.com:blacktrub/synchronizator9000.git .sync

touch ~/.vimrc
touch /var/spool/cron/bt

if grep -q '~/.sync/main.go' /var/spool/cron/bt
then
    echo "crontab already exists"
else
    cat ~/.sync/crontab.txt >> /var/spool/cron/bt
fi

if [[ -d "~/.cnf" ]]
then
    echo "config directory exists, backup to .config_old"
    mv ~/.cnf ~/.cnf_old
fi

echo "create symlink to sync config"
ln -s ~/.cnf ~/.sync/.config/

