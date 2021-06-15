#!/bin/bash
DOTF="$(dirname $(realpath $0))"
cd "$HOME"

ln -s "$DOTF/vimrc" .vimrc
ln -s "$DOTF/tmux.conf" .tmux.conf

# WSL only
if [ -n "$(uname -r | grep microsoft)" ]; then
    ln -s "$DOTF/bash_aliases.wsl" .bash_aliases
    $DOTF/wslconf.sh
fi

$DOTF/gitconf.sh

echo 'Set up your proxy and open `vim` to continue.'
