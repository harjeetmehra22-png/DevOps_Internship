#!/bin/bash

matches=$(grep -i "Linux" *.txt)

if [ -z "$matches" ]; then
 echo "No matches found"
else
 echo "$matches"
fi
