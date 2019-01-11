#!/usr/bin/env bash

docker run -it --rm -e HOSTUID=$(id -u) -v $(pwd):/root hseeberger/scala-sbt sh ./build-project.sh
if [[ $? -eq 0 ]]
then 
bash -c "cd driver && docker build -t session-segmenter-driver ."
bash -c "cd driver && docker tag session-segmenter-driver session-segmenter-driver:1"
bash -c "cd app && docker build -t session-segmenter-app ."
bash -c "cd driver && docker tag session-segmenter-app session-segmenter-app:1"
bash -c "cd reader && docker build -t session-segmenter-reader ."
bash -c "cd driver && docker tag session-segmenter-reader session-segmenter-reader:1"
else
  exit 1
fi
