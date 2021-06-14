#!/bin/bash
DOTF="$(dirname $(realpath $0))"
cd "$HOME"

ln -s "$DOTF/vimrc" .vimrc
ln -s "$DOTF/tmux.conf" .tmux.conf
if [ -n "$(which wsl.exe)" ]; then
    ln -s "$DOTF/bash_aliases.wsl" .bash_aliases
fi

read -p "(git) Name: " temp
git config --global user.name $temp
read -p "(git) Email: " temp
git config --global user.email $temp

git config --global alias.chmod "update-index --chmod"
git config --global alias.show-mode "ls-tree -rt HEAD"
git config --global alias.assume-unchanged "update-index --assume-unchanged"
git config --global alias.show-unchanged "ls-files -v"

if [ -n "$(which git.exe)" ] && [ "$(which git.exe)" != "$(which git).exe" ]; then
    GfWPath="$(dirname "$(dirname "$(which git.exe)")")"
    GCMCore="$GfWPath/mingw64/libexec/git-core/git-credential-manager.exe"
    git config --global credential.helper "$GCMCore"
fi

echo 'Configured: vimrc, tmux.conf, bash_aliases.wsl, gitconfig;'
echo 'Set up your proxy and open `vim` to continue.'
