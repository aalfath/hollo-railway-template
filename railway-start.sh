#!/bin/sh
# Railway start wrapper for Hollo: sets safe defaults, then runs Hollo's own
# start command (database migrations, then the server).
set -e

# Railway's edge proxy terminates TLS and sets X-Forwarded-* headers.
export BEHIND_PROXY="${BEHIND_PROXY:-true}"
export PORT="${PORT:-3000}"

# Media (avatars, headers, attachments, custom emojis) on the Railway volume
# mounted at /var/lib/hollo, served by Hollo itself under /assets/.
export DRIVE_DISK="${DRIVE_DISK:-fs}"
if [ "$DRIVE_DISK" = "fs" ]; then
  export FS_STORAGE_PATH="${FS_STORAGE_PATH:-/var/lib/hollo}"
  mkdir -p "$FS_STORAGE_PATH"
fi

# Public URL base for media. Defaults to the service's Railway domain.
if [ -z "$STORAGE_URL_BASE" ] && [ -n "$RAILWAY_PUBLIC_DOMAIN" ]; then
  export STORAGE_URL_BASE="https://$RAILWAY_PUBLIC_DOMAIN"
fi

cd /app
exec pnpm run prod
