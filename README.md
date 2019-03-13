# SSH Tunnel

This SSH Tunnel provides a simplistic way to set up an SSH tunnel to a remote
host to securely connect without having to expose your host too much.

## Usage

### Private key file

The container assumes your private key doesn't have a password and is mounted
under `/private-ssh-key`.

### Configuration

- `$PORTS` the ports you want to forwarded, space seperated (e.g. remote server, local client)
- `$REVERSE_PORTS` the ports you want to reverse forwarded, space seperated (e.g. local server, remote client)
- `$USERNAME` the username for your ssh key
- `$REMOTE_HOST` the remote host you want to set up a local tunnel for
- `$BIND_ADDRESS` the address you want to bind the tunnel to. (default: `127.0.0.1`)

### Running the tunnel

```
$ docker run --rm \
    -p "9200:9200" \
    -p "9201:9201" \
    -v $(pwd)/private-ssh-key:/private-ssh-key \
    -e PORTS="9200 9201" \
    -e USERNAME=username \
    -e REMOTE_HOST=remote.example.com \
    putty182/ssh-tunnel
```
