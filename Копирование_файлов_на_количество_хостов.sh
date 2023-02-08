#!/bin/bash

for HOST in RHEL01 rhel02 mann1 rhel06 
do
scp test.txt $HOST:/tmp/
done

