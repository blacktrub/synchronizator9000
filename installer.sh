#!/bin/bash
mkdir -p .sync
git clone git@github.com:blacktrub/vscode-config.git .sync

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
