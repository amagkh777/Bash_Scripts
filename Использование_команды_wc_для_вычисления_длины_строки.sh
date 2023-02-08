#!/bin/bash

str="моя строка"
length=$(echo -n "моя строка" | wc -m)
echo "Длина моей строки $length"
