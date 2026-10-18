FROM scratch as ctx
COPY build_files /

FROM ghcr.io/garrettptech/kitsunelinux-base:latest

COPY system_files /

#Runs Scripts
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh

RUN bootc container lint