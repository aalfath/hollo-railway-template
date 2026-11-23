# Changelog

Each entry is one version of this Railway template. Breaking changes are listed first.

## 0.9.26 (2026-11-23)

- Breaking changes: none. No new variables.
- Security release: stored cross-site scripting in web post rendering, private-network access through preview-card fetching, and Fedify 2.2.21 (timeouts for WebFinger, delivery and NodeInfo; origin checks for embedded JSON-LD). See the [0.9.26 release notes](https://github.com/fedify-dev/hollo/releases/tag/0.9.26).
- Hollo 0.9.25 → **0.9.26** (`ghcr.io/fedify-dev/hollo:0.9.26@sha256:a10dd500445f8c56c09c5d6b0021889e5edf71dc93228389147211b49b5e7bfc`).
- Tested on Railway before merging: the published template was deployed, data was written, the service was switched to this version, and the data and login were still there.

## 0.9.25 (2026-11-17)

- First release: Hollo 0.9.25 (`ghcr.io/fedify-dev/hollo:0.9.25`, pinned by digest `sha256:99e780ac5864d9922f3bc1a9f59750039495fc3748fd3ebb32c43f92a291bd3d`).
- Media on a Railway volume (`/var/lib/hollo`, served at `/assets/`), so no external S3 bucket is needed.
- Railway Postgres for all other data. `SECRET_KEY` is generated per deploy.
