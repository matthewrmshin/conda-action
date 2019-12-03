#!/bin/bash
set -eu
set -o pipefail

ENV_PREFIX="${GITHUB_WORKSPACE}/myenv"

env_invoke() {
    . '/opt/conda/etc/profile.d/conda.sh'
    conda activate "${ENV_PREFIX}"
    "$@"
    find "${ENV_PREFIX}" -type f -ls
}

main() {
    if ! conda env list 1>'/dev/null' | grep -F "${ENV_PREFIX}"; then
        (conda create -y -p "${ENV_PREFIX}")
    fi
    if (($# != 0)); then
        (env_invoke "$@")
    fi
}

main "$@"
