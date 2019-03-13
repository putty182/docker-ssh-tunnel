#!/bin/sh
LOCAL_FORWARDING="";
REMOTE_FORWARDING="";

for PORT in $PORTS; do
    LOCAL_FORWARDING="$LOCAL_FORWARDING -L *:$PORT:localhost:$PORT "
done

for REVERSE_PORT in $REVERSE_PORTS; do
    REMOTE_FORWARDING="$REMOTE_FORWARDING -R *:$REVERSE_PORT:localhost:$REVERSE_PORT "
done


ssh -v \
    -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    -o GlobalKnownHostsFile=/dev/null \
    -o ServerAliveInterval=${KEEP_ALIVE:-180} \
    -i /private-ssh-key \
    $LOCAL_FORWARDING \
    $REMOTE_FORWARDING \
    "$USERNAME@$REMOTE_HOST" -N
