#!/bin/bash
DOTF="$(dirname $(realpath $0))"

cd "$DOTF"
git clone --depth 1 https://github.com/junegunn/vim-plug.git

cd "$HOME"
ln -s "$DOTF/vimrc" .vimrc
ln -s "$DOTF/tmux.conf" .tmux.conf
mkdir -p .vim/autoload
mv "$DOTF/vim-plug/plug.vim" .vim/autoload

rm -rf "$DOTF/vim-plug"
