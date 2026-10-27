FROM scratch as ctx
COPY build_files /
COPY system_files /system_files

FROM ghcr.io/ublue-os/kinoite-main:latest

#Runs Scripts
RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/pkgs.sh  && /ctx/services.sh
#&& /ctx/flatpaks.sh

RUN bootc container lint