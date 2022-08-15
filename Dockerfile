FROM bash

LABEL org.opencontainers.image.source=https://github.com/seemiller/release

COPY ./templates/Dockerfile /
COPY ./templates/.golangci.yaml /
