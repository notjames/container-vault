#!/bin/bash

#shopt -s nullglob

TAG=$1
BASE=$PWD

build_deps()
{
  cd build && \
    for dep in *
    do
      if [[ -d $dep ]]
      then
        cd $dep && make
      fi
    done
}

if [[ -n "$TAG" ]] 
then
  # create deps in pkgs path
  build_deps

  cd $BASE

  # now build main vault container
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

