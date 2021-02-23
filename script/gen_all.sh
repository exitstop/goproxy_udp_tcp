#!/bin/bash

#./script/gen_all.sh goproxy smtp 25 172.31.34.201:25 false false > script/run_goproxy.sh

NAME=$1
NAME2=$2
LOCALPORT=$3
REMOTEADDR=$4
DEBUG=$5
VERBOSE=$6
UDP=$7

./script/gen_run_app.sh $NAME $NAME2 $LOCALPORT $REMOTEADDR $DEBUG $VERBOSE $UDP > script/run_$NAME$NAME2.sh
./script/gen_service.sh $NAME$NAME2  > script/$NAME$NAME2.service

#sudo chmod +x script/*.sh
