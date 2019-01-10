#!/usr/bin/env bash

docker run -it --rm -v $(pwd):/root hseeberger/scala-sbt sh ./build-project.sh
#docker run -it --rm -v $(pwd):/user hseeberger/scala-sbt cd /user && sbt compile assembly
if [[ $? -eq 0 ]]
then 
bash -c "cd driver && docker build -t session-segmenter-driver ."
bash -c "cd app && docker build -t session-segmenter-app ."
bash -c "cd reader && docker build -t session-segmenter-reader ."
else
  exit 1
fi
