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
        rm -rf pkg/* 2>/dev/null

        cd $dep && make
      fi
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

  echo "does symlink translate?"
  ls -altr build/jo/pkg/

  echo "checking pkgs:"
  ls -altr pkgs/

  if [[ $(find pkgs/ -maxdepth 1 -type f -name '[a-zA-Z]*' | wc -l) == 0 ]] 
  then 
    echo "WARN: Hmm. No dep packages in pkgs/; this is likely bad, but moving on."
  fi

  # now build main vault container
  if docker build -t $TAG .
  then
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

