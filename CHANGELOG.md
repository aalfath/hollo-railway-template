# Changelog

Each entry is one version of this Railway template. Breaking changes are listed first.

## 0.9.25 (2026-11-17)

- First release: Hollo 0.9.25 (`ghcr.io/fedify-dev/hollo:0.9.25`, pinned by digest `sha256:99e780ac5864d9922f3bc1a9f59750039495fc3748fd3ebb32c43f92a291bd3d`).
- Media on a Railway volume (`/var/lib/hollo`, served at `/assets/`), so no external S3 bucket is needed.
- Railway Postgres for all other data. `SECRET_KEY` is generated per deploy.
