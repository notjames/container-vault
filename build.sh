#!/bin/bash

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

      ls -altr $BASE/pkgs/
    done
}

if ! which make
then
  if apk add --no-cache alpine-sdk build-base
  then
    echo "done"
  else
    echo >&2 "Hmm, try something else. Sorry it didn't work out."
    exit 2
  fi
fi

if [[ -n "$TAG" ]] 
then
  # create deps in pkgs path
  build_deps

  cd $BASE

  # now build main vault container
  if docker build -t $TAG .
  then
    ls -altr pkgs/*
    rm -rf pkgs/* 2>/dev/null
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

