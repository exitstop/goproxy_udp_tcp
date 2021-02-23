#!/bin/bash

for (( ; ; ))
do
   echo "[RUN] goproxy smtp"
   sudo ./build/goproxy -debug=false -udp=false -verbose=false :25 172.31.34.201:25
   sleep 2
done
