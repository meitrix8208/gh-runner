# GitHub Actions Runner

This image is an extension of [myoung34/docker-github-actions-runner] 
and [ixc/github-actions-runner-docker] that:

- Supports scaling via [docker compose up --scale SERVICE=NUM] or the [compose file v2 scale] option.

## Usage

Here is an example compose file with scaling:

```yaml
services:
  runner:
    image: runner
    restart: always
    environment:
      RUNNER_WORKDIR: /tmp/runners/work
      RUNNER_GROUP: default
      RUNNER_SCOPE: 'org'
      ACCESS_TOKEN: ghp_...
      ORG_NAME: OCTOPUS
      CONFIGURED_ACTIONS_RUNNER_FILES_DIR: /tmp/actions
      DISABLE_AUTOMATIC_DEREGISTRATION: true
      RANDOM_RUNNER_SUFFIX: false
      LABELS: ubuntu-latest
    security_opt:
      # needed on SELinux systems to allow docker container to manage other docker containers
      - label:disable
    volumes:
      - '/var/run/docker.sock:/var/run/docker.sock'
      - '/tmp/runners:/tmp/runners'
      - '/tmp/actions:/tmp/actions'
      # note: a quirk of docker-in-docker is that this path
      # needs to be the same path on host and inside the container,
      # docker management cmd´s run outside of docker but expect the paths from within
```

[compose file v2 scale]: https://docs.docker.com/compose/compose-file/compose-file-v2/#scale
[docker compose up --scale SERVICE=NUM]: https://docs.docker.com/compose/reference/up/
[myoung34/docker-github-actions-runner]: https://github.com/myoung34/docker-github-actions-runner
[ixc/github-actions-runner-docker]: https://github.com/ixc/github-actions-runner-docker
