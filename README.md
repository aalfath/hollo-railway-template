[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/new/template/hollo?utm_medium=integration&utm_source=button&utm_campaign=hollo)

# Hollo on Railway

This repo deploys [Hollo](https://github.com/fedify-dev/hollo), the federated single-user microblogging server built on [Fedify](https://fedify.dev/), on [Railway](https://railway.com). Hollo speaks ActivityPub, so you can follow and be followed from Mastodon, Misskey and other fediverse servers, and it offers a Mastodon-compatible API for client apps.

## What the template deploys

| Service | Source | Notes |
|---|---|---|
| Hollo | this repo (`Dockerfile`) | Hollo **0.9.25**, official image `ghcr.io/fedify-dev/hollo:0.9.25` pinned by digest. Public, port 3000, health check `/login` (answers without a login and checks the database). Volume at `/var/lib/hollo` for media |
| Postgres | Railway Postgres | Accounts, posts, followers, timelines, sessions and the federation queue |

The repo adds only `railway-start.sh`. It turns on `BEHIND_PROXY` (Railway's edge terminates TLS), stores media on the volume (`DRIVE_DISK=fs`, `FS_STORAGE_PATH=/var/lib/hollo`, served by Hollo under `/assets/`) and sets `STORAGE_URL_BASE` to the service's Railway domain. You don't need an S3 bucket.

## Variables (Hollo service)

| Variable | Default | Purpose |
|---|---|---|
| `DATABASE_URL` | `${{Postgres.DATABASE_URL}}` | Postgres connection over the private network |
| `SECRET_KEY` | `${{secret(64)}}` | Signs login cookies. Hollo needs at least 44 characters. Generated per deploy |
| `PORT` | `3000` | Port Hollo listens on |

You don't need to enter anything at deploy time. Optional settings can be added later on the Hollo service, for example `TZ`, `LOG_LEVEL`, `MEDIA_PROXY`, `HOME_URL` or `SENTRY_DSN` (see [Hollo's environment variables](https://docs.hollo.social/install/env/)). To keep media in S3-compatible storage instead of the volume, set `DRIVE_DISK=s3`, `STORAGE_URL_BASE`, `S3_REGION`, `S3_BUCKET`, `S3_ENDPOINT_URL`, `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`. Files already stored stay where they are.

## First setup

1. **Choose your domain first.** Your fediverse handle (`@you@domain`) is fixed when you create the account and can't be changed later. If you want a custom domain, add it to the Hollo service in Railway *before* the next step, and set `STORAGE_URL_BASE=https://YOUR-DOMAIN` on the service.
2. Open `https://YOUR-DOMAIN/setup` right after the deploy finishes. Hollo asks for an email and password for the owner login. There is no default password, and until you do this anyone who opens the URL can claim the instance, so do it first.
3. Create your account (username, display name, bio) at `/accounts`.
4. Hollo has only a small web interface of its own. Sign in to it from a Mastodon client such as [Phanpy](https://phanpy.social/), [Elk](https://elk.zone/) or Ivory, using your domain as the server.

## Updates

The Hollo service builds from this repo's `main` branch. When a new Hollo version is pinned here, Railway shows you an "update available" notice in your project, and you choose when to apply it. Each version is listed in [CHANGELOG.md](CHANGELOG.md), with breaking changes first. Hollo runs its database migrations on start, and your media stays on the volume.

## Licence

Hollo is AGPL-3.0. This wrapper only adds a start script.
