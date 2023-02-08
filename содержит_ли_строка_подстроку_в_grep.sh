#!/bin/bash

STR='GNU/Linux это операционная система'
SUB='Linux'

if grep -q "$SUB" <<< "$STR"; then
  echo "Присутствует"
fi
