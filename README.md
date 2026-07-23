# netcat-docker

Minimal Docker image for [netcat](https://man.openbsd.org/nc) (`nc`) based on Alpine Linux, rebuilt every week and pushed to both Docker Hub and the GitHub Container Registry (GHCR).

## Why this project
I actually needed such a (very) minimal image for work, yet available images were pushed nearly a decade ago. I figured out that building what I need myself is the best way to solve my problems, so there we are.

## Usage

The image is published to two registries — use whichever you prefer:

```bash
docker pull loice5/netcat            # Docker Hub
docker pull ghcr.io/loice5/netcat    # GHCR
```

```bash
# TCP connectivity check
docker run --rm loice5/netcat -zv google.com 443

# Listen on a port
docker run --rm -p 9000:9000 loice5/netcat -l -p 9000

# Pipe data to a remote host
echo "hello" | docker run --rm -i loice5/netcat example.com 9000
```

## Running as non-root

The image runs as the unprivileged `nobody` user rather than root — all of the examples
above work unchanged. Because the `nc` binary carries the `cap_net_bind_service` file
capability, you can even listen on a privileged port (< 1024) without any extra runtime
flags. So both of these work:

```bash
# Map a low host port to a high container port (no special privilege involved)
docker run --rm -p 80:9000 loice5/netcat -l -p 9000

# ...or bind the low port directly — the baked capability makes this work as nobody
docker run --rm -p 80:80 loice5/netcat -l -p 80
```

## Image

| Base         | Package          | Tag      | User     |
|--------------|------------------|----------|----------|
| alpine:latest | netcat-openbsd  | `latest` | `nobody` |

Rebuilt every Monday at 03:00 UTC to pick up the latest Alpine and netcat-openbsd updates, and pushed to both `loice5/netcat` (Docker Hub) and `ghcr.io/loice5/netcat` (GHCR).
