#!/bin/bash
set -eu
set -o pipefail

if ! conda env list 1>'/dev/null' | grep -F 'base'; then
    conda create -y -n 'base'
    echo '. /opt/conda/etc/profile.d/conda.sh' >> ~/.bashrc
    . '/opt/conda/etc/profile.d/conda.sh'
fi
set -x
if (($# != 0)); then
    conda activate 'base'
    "$@"
fi
exit
