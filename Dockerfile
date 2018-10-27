FROM debian:stretch-slim

ENV ARCH=armhf

RUN apt-get update \
  && apt-get install -y apt-utils locales \
  && apt-get install -y curl tzdata \
  && locale-gen en_US.UTF-8 \
  && curl -SLO "https://github.com/just-containers/s6-overlay/releases/download/v1.20.0.0/s6-overlay-${ARCH}.tar.gz" \
  && tar -xzf s6-overlay-amd64.tar.gz -C / \
  && tar -xzf s6-overlay-amd64.tar.gz -C /usr ./bin \
  && rm -rf s6-overlay-amd64.tar.gz \
  && useradd -u 911 -U -d /config -s /bin/false abc \
  && usermod -G users abc \
  && mkdir -p /app /config /defaults \
  && apt-get clean \
  && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

COPY rootfs /

ENTRYPOINT [ "/init" ]
