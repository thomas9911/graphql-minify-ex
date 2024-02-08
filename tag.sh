#! /bin/bash

if [ "$#" -ne 1 ]; then
    echo "Error: Only one argument expected and that is the tag version like '0.1.0'"
else
  git tag -a "v$1"
  git push origin --tags
fi
