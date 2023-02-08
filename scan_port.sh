#!/bin/bash
  
for PORT in {20..80}; do
  timeout 1 bash -c "</dev/tcp/192.168.1.1/$PORT &>/dev/null" &&  echo "port $PORT is open"
done
