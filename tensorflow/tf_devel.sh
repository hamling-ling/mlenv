#!/bin/bash

# https://www.tensorflow.org/install/source
# 1. first time pull docker image
#    $ docker pull tensorflow/tensorflow:nightly-devel-gpu-py3
# 2. Then run the image
#    $ tf_devel.sh
# 3. In the container
#    # cd /tensorflow_src
#    # git tag
#    # git checkout /refs/tags/v2.0.1
#    # ./configure
#    #   I specified -march=nehalem -Wno-sign-compare for my old PC
#    # If configure says to downlorade bazel
#    #   rm -rf /usr/local/bin/bazel
#    #   wget -O /bazel/installer.sh "https://github.com/bazelbuild/bazel/releases/download/0.26.1/bazel-0.26.1-installer-linux-x86_64.sh"
#    #   chmod + x /bazel/installer.sh
#    #   /bazel/installer.sh
#    #   then configure again
# 4. Build
#    # bazel build --config=opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
#    add resource limitation if low spec pc
#    ex) --local_resources 16384,4,1.0  #RAM 16GB, CPU Cores 4, and 1.0
# 5. Create package
#    # bazel-bin/tensorflow/tools/pip_package/build_pip_package /mnt
#    # chown $HOST_PERMS /mnt/tensorflow-version-tags.whl
# 6. Install within the container to check
#    # pip uninstall tensorflow  # remove current version
#    # pip install /mnt/tensorflow-version-tags.whl
#    # cd /tmp  # don't import from source directory
#    # python -c "import tensorflow as tf; print(tf__version__)"


function tf() {
    docker run --runtime=nvidia -it -w /tensorflow -v $PWD:/mnt -e HOST_PERMS="$(id -u):$(id -g)" \
	   tensorflow/tensorflow:latest-devel-gpu-py3 bash
}

tf
