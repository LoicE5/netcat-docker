# Changelog

## 1.2.0 - 2026-07-23

### Changed
- Image now runs as the unprivileged `nobody` user instead of root

### Added
- `cap_net_bind_service` file capability on the `nc` binary so non-root listeners can still bind privileged ports (< 1024) without extra runtime flags

## 1.1.0 - 2026-06-02

### Added
- GitHub Actions workflow to publish the image to the GitHub Container Registry (GHCR) at `ghcr.io/loice5/netcat`, using the built-in `GITHUB_TOKEN`

### Changed
- Renamed the Docker Hub workflow file to `publish-dockerhub.yaml` for symmetry with the GHCR workflow
- Disabled provenance/SBOM attestations on both workflows to avoid a phantom `unknown/unknown` architecture entry in the registry listings

## 1.0.0 - 2026-04-29

### Added
- `Dockerfile` based on `alpine:latest` with `netcat-openbsd`
- GitHub Actions workflow to rebuild and push `latest` to Docker Hub every Monday
- Manual `workflow_dispatch` trigger for on-demand publishes
