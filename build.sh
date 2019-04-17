#!/usr/bin/env bash
if [ $# -eq 0 ]
  then
    project='myproject'
  else
    project=$1
fi

if [ $# -le 1 ]
  then
    tag='latest'
  else
    tag=$2
fi

if [ $# -le 2 ]
  then
    path='.'
  else
    path=$3
fi

DOCKER=/usr/bin/docker

echo $DOCKER build -t "$project:$tag" "$path"
$DOCKER build -t "$project:$tag" "$path"

