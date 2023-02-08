#!/bin/bash

AGE=$1

if [ $AGE -lt 13 ]; then
	echo "Ты же еще ребенок."
elif [ $AGE -lt 20 ]; then
	echo "Ты же подросток."
elif [ $AGE -lt 65 ]; then
	echo "Ты уже взрослая."
else
	echo "Ты-старейшина."
fi
