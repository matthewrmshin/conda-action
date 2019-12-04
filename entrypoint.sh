#!/bin/bash
set -eu
set -o pipefail

main() {
    local ENV_PREFIX="${GITHUB_WORKSPACE}/.myenv"
    . '/opt/conda/etc/profile.d/conda.sh'
    set +u
    if ! conda activate "${ENV_PREFIX}"; then
        conda create -y -p "${ENV_PREFIX}"
        conda activate "${ENV_PREFIX}"
    fi
    set -u
    if (($# != 0)); then
        "$@"
    fi
}

main "$@"
