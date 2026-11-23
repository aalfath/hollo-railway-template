# Hollo, official image, pinned by version and digest.
# To update: change the tag and digest together and add a CHANGELOG.md entry.
FROM ghcr.io/fedify-dev/hollo:0.9.26@sha256:a10dd500445f8c56c09c5d6b0021889e5edf71dc93228389147211b49b5e7bfc

COPY railway-start.sh /usr/local/bin/railway-start.sh
RUN chmod 755 /usr/local/bin/railway-start.sh

WORKDIR /app
EXPOSE 3000
CMD ["/usr/local/bin/railway-start.sh"]
