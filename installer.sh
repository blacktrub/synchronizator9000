#!/bin/bash
mkdir -p .sync
git clone git@github.com:blacktrub/synchronizator9000.git .sync

touch ~/.vimrc
if grep -q '.sync/.config/.vimrc' ~/.vimrc
then
    echo "vim pass enable"
else
    echo "try
source ~/.sync/.config/.vimrc
catch
endtry" >> ~/.vimrc
fi

touch ~/.zshrc
if grep -q '.sync/.config/updater.sh' ~/.zshrc
then
    echo "updater pass enable"
else
    echo "~/.sync/updater.sh" >> ~/.zshrc
fi

