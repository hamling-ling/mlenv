#!/bin/bash
docker run --runtime=nvidia -it \
       -w /tensorflow \
       -v $PWD:/mnt \
       -e HOST_PERMS="$(id -u):$(id -g)" \
       tensorflow/tensorflow:nightly-devel-gpu-py3 bash


