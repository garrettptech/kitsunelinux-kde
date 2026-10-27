FROM scratch as ctx
COPY build_files /

FROM ghcr.io/garrettptech/kitsunelinux-base:latest as base

COPY system_files /
RUN rm -rf /var/run && ln -s /run /var/run

#Runs Scripts
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/pkgs.sh && /ctx/flatpaks.sh && /ctx/services.sh

RUN bootc container lint