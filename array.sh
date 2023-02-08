#!/bin/bash
  
array=('first' 'second' 'third')
echo "${array[*]}"

echo ''

IFS=$'\n'
echo "${array[*]}"



"
first second third

first
second
third
"
