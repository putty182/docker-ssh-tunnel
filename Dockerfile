FROM alpine
MAINTAINER putty182

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*

CMD ssh -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    -o GlobalKnownHostsFile=/dev/null \
    -o ServerAliveInterval=${KEEP_ALIVE:-180} \
    -i /private-ssh-key \
    ${SSH_OPTIONS} \
    "${USERNAME}@${REMOTE_HOST}" -N
