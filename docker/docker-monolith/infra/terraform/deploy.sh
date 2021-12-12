#!/bin/bash
set -e

if [ "$1" != "" ]
then
  docker run --name reddit -d -p 9292:9292 $1
else
  echo "Nothing to run!"
fi
