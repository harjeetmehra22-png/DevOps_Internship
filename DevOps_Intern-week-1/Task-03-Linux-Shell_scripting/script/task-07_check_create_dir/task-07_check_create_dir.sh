#!/bin/bash

dir="my_folder"
if [ -d "$dir" ]; then
  echo "Directory '$dir' already exists."
else
  echo "Creating directory '$dir'"
  mkdir "$dir"
fi
