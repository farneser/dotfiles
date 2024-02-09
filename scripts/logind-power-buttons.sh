#!/bin/bash
read -d '' conf << EOF
[Login]
HandlePowerKey=suspend
HandlePowerKeyLongPress=poweroff
EOF

echo "${conf}" >> /etc/systemd/logind.conf

