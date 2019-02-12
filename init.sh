#!/bin/sh

PORTS=${$PORTS:-8080 8081}

LOCAL_FORWARDING="";

for PORT in "$PORTS"; do
    echo LOCAL_FORWARDING="$LOCAL_FORWARDING -L '*:$PORT:${BIND_ADDRESS:127.0.0.1}:PORT'"
done


ssh -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    -o GlobalKnownHostsFile=/dev/null \
    -o ServerAliveInterval=${KEEP_ALIVE:-180} \
    -i /private-ssh-key \
    ${LOCAL_FORWARDING} \
    "$USERNAME@$REMOTE_HOST" -N