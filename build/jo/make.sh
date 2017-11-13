#!/bin/sh

docker build --tag jo-build:latest .
docker run -v $PWD/pkg:/pkg -it jo-build:latest cp jo /pkg
