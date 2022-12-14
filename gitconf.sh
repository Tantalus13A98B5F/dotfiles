#!/bin/bash
GIT=${1:-git}
read -p "(git) Name: " temp
$GIT config --global user.name $temp
read -p "(git) Email: " temp
$GIT config --global user.email $temp

$GIT config --global alias.chmod "update-index --chmod"
$GIT config --global alias.show-mode "ls-tree -rt HEAD"
$GIT config --global alias.assume-unchanged "update-index --assume-unchanged"
$GIT config --global alias.show-unchanged "ls-files -v"

GITEXE="$(which git.exe)"
if [ "$GIT" != "git.exe" ] && [ -n "$GITEXE" ] && [ "$GITEXE" != "$(which git).exe" ]; then
    GfWPath="$(dirname "$(dirname "$GITEXE")")"
    GCMCore="$GfWPath/mingw64/bin/git-credential-manager.exe"
    $GIT config --global credential.helper "${GCMCore/ /\\ }"
fi
