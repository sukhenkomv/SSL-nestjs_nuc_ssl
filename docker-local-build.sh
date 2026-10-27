#!/bin/bash

docker build \
  --progress=plain -f ./Dockerfile -t nestjs-nuc-ssl .
