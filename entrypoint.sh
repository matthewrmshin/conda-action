#!/bin/bash
set -eu
set -o pipefail

if ! conda env list 1>'/dev/null' | grep -F 'myenv'; then
    conda create -y -n 'myenv'
    echo '. /opt/conda/etc/profile.d/conda.sh' >> ~/.bashrc
    . '/opt/conda/etc/profile.d/conda.sh'
fi
set -x
if (($# != 0)); then
    conda activate 'myenv'
    "$@"
fi
exit
