#!/bin/sh
LOCAL_FORWARDING="";

for PORT in "$PORTS"; do
    LOCAL_FORWARDING="$LOCAL_FORWARDING -L '*:$PORT:localhost:$PORT' "
done


ssh -v \
    -o StrictHostKeyChecking=no \
    -o UserKnownHostsFile=/dev/null \
    -o GlobalKnownHostsFile=/dev/null \
    -o ServerAliveInterval=${KEEP_ALIVE:-180} \
    -i /private-ssh-key \
    $LOCAL_FORWARDING \
    "$USERNAME@$REMOTE_HOST" -N
