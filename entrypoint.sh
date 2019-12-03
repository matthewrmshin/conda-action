#!/bin/bash
set -eu
set -o pipefail

main() {
    local ENV_PREFIX="${GITHUB_WORKSPACE}/myenv"
    . '/opt/conda/etc/profile.d/conda.sh'
    if ! conda activate "${ENV_PREFIX}" 2>'/dev/null'; then
        conda create -y -p "${ENV_PREFIX}"
    fi
    if (($# != 0)); then
        "$@"
        find "${GITHUB_WORKSPACE}" -type d
    fi
}

main "$@"
