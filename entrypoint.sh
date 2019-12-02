#!/bin/bash
set -eu
set -o pipefail

if ! conda env list 1>'/dev/null' | grep -F "${GITHUB_WORKSPACE}"; then
    conda create -y -p "${GITHUB_WORKSPACE}"
    echo '. /opt/conda/etc/profile.d/conda.sh' >> ~/.bashrc
    . '/opt/conda/etc/profile.d/conda.sh'
fi
set -x
if (($# != 0)); then
    conda activate "${GITHUB_WORKSPACE}"
    "$@"
    ls -lA "${GITHUB_WORKSPACE}/bin"
fi
exit
