#!/bin/bash
while IFS= read -r line
do
  echo "$line"
done < input_file






while IFS= read -r line
do
  echo "$line"
done < <(cat input_file )
