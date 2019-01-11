#!/usr/bin/env bash

docker run -it --rm -e HOSTUID=$(id -u) -v $(pwd):/root hseeberger/scala-sbt sh ./build-project.sh
if [[ $? -eq 0 ]]
then 
bash -c "cd driver && docker build -t session-segmenter-driver ."
bash -c "cd app && docker build -t session-segmenter-app ."
bash -c "cd reader && docker build -t session-segmenter-reader ."
else
  exit 1
fi
