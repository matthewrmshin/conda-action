#!/bin/bash
set -eu
set -o pipefail

main() {
    set -x
    local ENV_PREFIX="${GITHUB_WORKSPACE}/myenv"
    . '/opt/conda/etc/profile.d/conda.sh'
    if ! conda activate "${ENV_PREFIX}"; then
        conda create -y -p "${ENV_PREFIX}"
        conda activate "${ENV_PREFIX}"
    fi
    if (($# != 0)); then
        "$@"
    fi
}

main "$@"
