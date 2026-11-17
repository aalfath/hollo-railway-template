# Hollo, official image, pinned by version and digest.
# To update: change the tag and digest together and add a CHANGELOG.md entry.
FROM ghcr.io/fedify-dev/hollo:0.9.25@sha256:99e780ac5864d9922f3bc1a9f59750039495fc3748fd3ebb32c43f92a291bd3d

COPY railway-start.sh /usr/local/bin/railway-start.sh
RUN chmod 755 /usr/local/bin/railway-start.sh

WORKDIR /app
EXPOSE 3000
CMD ["/usr/local/bin/railway-start.sh"]
