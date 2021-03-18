#!/bin/bash

USER_OPT=
USER_PARAM=
if [ "$1" != "--root" ]; then
    USER_OPT=-u
    USER_PARAM=$(id -u $USER):$(id -g $USER)
fi

# https://docs.nvidia.com/deeplearning/sdk/tensorrt-container-release-notes/running.html
# do following once
#docker pull nvcr.io/nvidia/tensorflow:20.06-py3
# then
#nvidia-docker run -it --rm nvcr.io/nvidia/tensorrt:20.06-py3

function tfrt() {
    nvidia-docker run \
	   -v `realpath ~/Github`:/notebooks/Github \
	   -v /etc/group:/etc/group:ro \
	   -v /etc/passwd:/etc/passwd:ro \
	   -v $HOME:$HOME -e "HOME=$HOME" \
	   $USER_OPT $USER_PARAM \
	   -it \
	   -p 8888:8888 \
	   -p 6006:6006 \
	   --rm \
	   tensor-rt bash
}

tfrt
