#!/bin/bash

# https://www.tensorflow.org/install/source
# 1. first time pull docker image
#    $ docker pull tensorflow/tensorflow:nightly-devel-gpu-py3
# 2. Then run the image
#    $ tf_devel.sh
# 3. In the container
#    # ./configure
# 4. Build
#    # bazel build --config=opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
#    add resource limitation if low spec pc
#    ex) --local_resources 4096,8,1.0  #RAM 4096MB, CPU Cores 8, and 1.0
# 5. Create package
#    # bazel-bin/tensorflow/tools/pip_package/build_pip_package /mnt
#    # chown $HOST_PERMS /mnt/tensorflow-version-tags.whl
# 6. Install within the container to check
#    # pip uninstall tensorflow  # remove current version
#    # pip install /mnt/tensorflow-version-tags.whl
#    # cd /tmp  # don't import from source directory
#    # python -c "import tensorflow as tf; print(tf.contrib.eager.num_gpus())"


function tf() {
    docker run --runtime=nvidia -it -w /tensorflow -v $PWD:/mnt -e HOST_PERMS="$(id -u):$(id -g)" \
    tensorflow/tensorflow:nightly-devel-gpu-py3 bash
}

tf
