#!/bin/bash
set -eu
set -o pipefail

if ! conda env list 1>'/dev/null' | grep -F "${GITHUB_WORKSPACE}/myenv"; then
    conda create -y -p "${GITHUB_WORKSPACE}/myenv"
    echo '. /opt/conda/etc/profile.d/conda.sh' >> ~/.bashrc
    . '/opt/conda/etc/profile.d/conda.sh'
fi
set -x
if (($# != 0)); then
    conda activate "${GITHUB_WORKSPACE}/myenv"
    "$@"
    ls -lA "${GITHUB_WORKSPACE}/myenv/bin"
fi
exit
