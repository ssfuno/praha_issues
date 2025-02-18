FROM mysql:8.0.41-debian

RUN apt-get update && apt-get install -y --no-install-recommends \
    mecab \
    mecab-ipadic-utf8 \
    && rm -rf /var/lib/apt/lists/*