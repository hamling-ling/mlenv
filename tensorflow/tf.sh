#!/bin/bash

function tf() {
    docker run --runtime=nvidia \
	   -v `realpath ~/GitHub`:/notebooks/GitHub \
           -v /etc/group:/etc/group:ro \
	   -v /etc/passwd:/etc/passwd:ro \
	   -u $(id -u $USER):$(id -g $USER) \
	   --rm \
	   -it \
	   -p 8888:8888 \
	   -p 6006:6006 \
	   tensor-plus bash
}

tf
