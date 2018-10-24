#!/bin/bash

function tf() {
    docker run --runtime=nvidia \
	   -v `realpath ~/GitHub`:/notebooks/GitHub \
	   --rm \
	   -it \
	   -p 8888:8888 \
	   -p 6006:6006 \
	   tensor-plus bash
}

tf
