#!/usr/bin/env bash

variables=( [1]=$sysvar1 [2]=$sysvar2 [3]=$sysvar3 [4]=$sysvar3 )

checkvars () {

local var

for var in "$@"
do
  [[ "$var" ]] && echo "Var exist: $var;"
    || echo "Empty var!"
done
}

checkvars "${variables[@]}"
