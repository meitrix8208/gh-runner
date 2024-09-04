FROM myoung34/github-runner:latest
# this is a workaround for to allow multiple runners to run on the same host
# Wrap the entrypoint and use an anonymous volume to persist a random unique ID so we
# can scale with Docker Compose.
COPY entrypoint-wrapper.sh /
ENTRYPOINT ["/entrypoint-wrapper.sh"]
CMD ["/actions-runner/bin/runsvc.sh"]
VOLUME /tmp/github-actions
