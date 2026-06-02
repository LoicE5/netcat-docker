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

## Image

| Base         | Package          | Tag      |
|--------------|------------------|----------|
| alpine:latest | netcat-openbsd  | `latest` |

Rebuilt every Monday at 03:00 UTC to pick up the latest Alpine and netcat-openbsd updates, and pushed to both `loice5/netcat` (Docker Hub) and `ghcr.io/loice5/netcat` (GHCR).
