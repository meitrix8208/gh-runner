#!/usr/bin/dumb-init /bin/bash
if [[ ! -f /tmp/github-actions/runner_id.txt ]]; then
    head /dev/urandom | tr -dc a-f0-9 | head -c 13 > /tmp/github-actions/runner_id.txt
fi
_RUNNER_ID="$(cat /tmp/github-actions/runner_id.txt)"
RUNNER_NAME="${RUNNER_NAME}-${_RUNNER_ID}"
RUNNER_WORKDIR="${RUNNER_WORKDIR}/${_RUNNER_ID}"
exec /entrypoint.sh $@
