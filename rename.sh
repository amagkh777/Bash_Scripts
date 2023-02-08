#!/bin/bash
for f in *.html; do
    mv -- "$f" "${f%.html}.php"
done