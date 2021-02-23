#!/bin/bash

NAME=$1

WORK_DIR=/home/ubuntu/$NAME

cat  << EOF
[Unit]
Description=$NAME
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
WorkingDirectory=$WORK_DIR/

ExecStart=/usr/bin/screen -DmS $NAME bash -c '$WORK_DIR/script/run_$NAME.sh'

ExecReload=/usr/bin/screen -X -S $NAME quit
ExecReload=/usr/bin/screen -DmS $NAME bash -c '$WORK_DIR/script/run_$NAME.sh'

ExecStop=/usr/bin/screen -S $NAME -X stuff "^C"
ExecStop=/usr/bin/screen -X -S $NAME quit

User=ubuntu
Group=ubuntu
KillMode=none
TimeoutStopSec=5

[Install]
WantedBy=multi-user.target
EOF
