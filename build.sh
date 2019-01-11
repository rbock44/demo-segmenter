#!/usr/bin/env bash

docker run -it --rm -e HOSTUID=$(id -u) -v $(pwd):/root hseeberger/scala-sbt sh ./build-project.sh
if [[ $? -eq 0 ]]
then 
bash -c "cd driver && docker build -t session-segmenter-driver:1 ."
bash -c "cd app && docker build -t session-segmenter:1 ."
bash -c "cd reader && docker build -t session-segmenter-reader:1 ."
else
  exit 1
fi
