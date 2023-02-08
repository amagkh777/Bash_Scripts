#!/bin/bash

VAR1="AndreyEx"
VAR2="Ubuntu"

if [[ "$VAR1" > "$VAR2" ]]; then
    echo "${VAR1} лексикографически больше, чем ${VAR2}."
elif [[ "$VAR1" < "$VAR2" ]]; then
    echo "${VAR2} лексикографически больше, чем ${VAR1}."
else
    echo "Строки равны"
fi
