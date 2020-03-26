#!/bin/bash

USER_OPT=
USER_PARAM=
if [ "$1" != "--root" ]; then
    USER_OPT=-u
    USER_PARAM=$(id -u $USER):$(id -g $USER)
fi

function tf() {
    docker run --runtime=nvidia \
	   -v `realpath ~/GitHub`:/notebooks/GitHub \
           -v /etc/group:/etc/group:ro \
	   -v /etc/passwd:/etc/passwd:ro \
	   -v $HOME/GitHub:$HOME/GitHub -e "HOME=$HOME" -e "GRANT_SUDO=yes"\
	   $USER_OPT $USER_PARAM \
	   --rm \
	   -it \
	   -p 8888:8888 \
	   -p 6006:6006 \
	   tensor-plus bash
}

tf
