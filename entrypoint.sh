#!/bin/bash
set -eu
set -o pipefail

if ! conda env list 1>'/dev/null' | grep -F '/github/workspace/.env'; then
    conda create -y --prefix='/github/workspace/.env'
    echo '. /opt/conda/etc/profile.d/conda.sh' >> ~/.bashrc
    . '/opt/conda/etc/profile.d/conda.sh'
fi
if (($# != 0)); then
    conda activate '/github/workspace/.env'
    "$@"
fi
