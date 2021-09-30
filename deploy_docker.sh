#!/bin/bash
echo params "$1 $2"
DOCKER_FILE="$1"
DOCKER_TAG="$2"

if [ -z $DOCKER_FILE ]
    then
    echo "Must provide full path to Dockerfile" >&2
    exit 1
fi

if [ -z $DOCKER_TAG ]
then
    echo "No tagname, defaulting to OasW:alpha" >&2
    DOCKER_TAG="alpha"
fi

if [ -f $DOCKER_FILE ]
then
    echo "Building $DOCKER_FILE"
    docker build --network='host' -t "oasw:$DOCKER_TAG" -  < $DOCKER_FILE 
else
    echo "$DOCKER_FILE is not a file, exiting" >&2
    exit 1 
fi