#!/bin/bash
if [ -z "$(grep umask /etc/wsl.conf 2>/dev/null)" ]; then
    cat <<EOF | sudo tee -a /etc/wsl.conf >/dev/null
[automount]
options = "umask=022"
EOF
fi
cat /etc/wsl.conf
