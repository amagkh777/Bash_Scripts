#!/bin/bash

TEMP=$1

if [ $TEMP -gt 5 ]; then
 if [ $TEMP -lt 15 ]; then
  echo "Погода холодная."
 elif [ $TEMP -lt 25 ]; then
  echo "Погода хорошая."
 else
  echo "Погода стоит жаркая."
 fi
else
 echo "На улице холодно ..."
fi