#!/bin/bash

NAME=$1
NAME2=$2
LOCALPORT=$3
REMOTEADDR=$4
DEBUG=$5
VERBOSE=$6
UDP=$7

./script/gen_all.sh $NAME $NAME2 $LOCALPORT $REMOTEADDR $DEBUG $VERBOSE $UDP|| exit

rsync -avP --relative --delete \
    script/run_$NAME$NAME2.sh \
    script/$NAME$NAME2.service \
    build/goproxy \
    ubuntu@site:~/$NAME$NAME2

ssh ubuntu@site << OEF
    sudo cp ~/$NAME$NAME2/script/$NAME$NAME2.service /etc/systemd/system/
    sudo systemctl daemon-reload
    sudo systemctl enable $NAME$NAME2.service
    sudo systemctl stop $NAME$NAME2.service
    sudo systemctl start $NAME$NAME2.service
OEF
