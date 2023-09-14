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

if [ -n "$1" -a ! -h winhome ]; then
    ln -s "$1" winhome
    if [ -d "$1/.ssh" ]; then
        mkdir .ssh
        pushd .ssh
        cp $1/.ssh/* .
        chmod 600 *
        if [ -f config ]; then
            rm config
            ln -s "$1/.ssh/config"
        fi
        popd
    fi
fi

if [ ! -f winhome/.wslconfig ]; then
    cat >winhome/.wslconfig <<EOF
[wsl2]
memory = 8GB
EOF
fi
