#!/bin/bash

if [ -f "test.txt" ]; then
  echo "File exists."
else
  echo "Creating test.txt..."
  echo "This is a new file." > test.txt
fi

echo "✅ Common file test operators in Bash

-f file → file exists and is a regular file

-d file → file exists and is a directory

-e file → file exists (any type: file, directory, etc.)

-r file → file exists and is readable

-w file → file exists and is writable

-x file → file exists and is executable"
