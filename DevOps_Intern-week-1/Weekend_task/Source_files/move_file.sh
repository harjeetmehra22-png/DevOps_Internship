#!/bin/bash

mkdir -p source_files
for i in {1..10}
do 
 touch source_files/file$i.txt
done

mkdir -p destination_files
mv source_files/*.txt destination_files/

echo "All files moved successfully from source_files to destination_files"
