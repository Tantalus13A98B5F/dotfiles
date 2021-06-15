#!/bin/bash
DOTF="$(dirname $(realpath $0))"
cd "$HOME"

ln -s "$DOTF/vimrc" .vimrc
ln -s "$DOTF/tmux.conf" .tmux.conf
if [ -n "$(uname -r | grep microsoft)" ]; then
    ln -s "$DOTF/bash_aliases.wsl" .bash_aliases
fi

./gitconf.sh

echo 'Configured: vimrc, tmux.conf, bash_aliases.wsl, gitconfig;'
echo 'Set up your proxy and open `vim` to continue.'
