#!/bin/bash

if [ ! -f /etc/wsl.conf ]; then
    cat <<EOF | sudo tee -a /etc/wsl.conf >/dev/null
[automount]
options = "umask=022"

[boot]
systemd = true
EOF
fi
cat /etc/wsl.conf

WINUSPF="$(powershell.exe 'echo $env:userprofile' | sed 's/\r//')"
WINHOME="$(wslpath ${WINUSPF})"

if [ ! -h winhome ]; then
    ln -s "$WINHOME" winhome
    if [ -d "$WINHOME/.ssh" ]; then
        mkdir .ssh
        pushd .ssh
        cp $WINHOME/.ssh/* .
        chmod 600 *
        if [ -f config ]; then
            rm config
            ln -s "$WINHOME/.ssh/config"
        fi
        popd
    fi
fi

#if [ ! -f winhome/.wslconfig ]; then
#    cat >winhome/.wslconfig <<EOF
#[wsl2]
#memory = 8GB
#EOF
#fi
