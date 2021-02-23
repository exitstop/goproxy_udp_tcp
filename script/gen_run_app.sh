#!/bin/bash

NAME=$1
NAME2=$2
LOCALPORT=$3
REMOTEADDR=$4
DEBUG=$5
VERBOSE=$6
UPD=$7

cat  << EOF
#!/bin/bash

for (( ; ; ))
do
   echo "[RUN] $NAME $NAME2"
   sudo ./build/$NAME -debug=$DEBUG -udp=$UPD -verbose=$VERBOSE :$LOCALPORT $REMOTEADDR
   sleep 2
done
EOF
