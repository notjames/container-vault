#!/bin/bash

TAG=$1

build_deps()
{
  cd build && \
    for dep in $(find . -maxdepth 1 -type d)
    do
      cd $dep && \
        ./make.sh
    done
}

if [[ -n "$TAG" ]] 
then
  build_deps

  if docker build -t $TAG .
  then
    sudo rm -rf pkgs/* 2>/dev/null
    echo "done"
  else
    ec=$?
    echo >&2 "FATAL: docker build failed for vault container. Exit code was '$ec'"
    exit $ec
  fi
else
  echo >&2 "usage: $0 <vault tag>"
  exit 1
fi

