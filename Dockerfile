FROM ubuntu:20.04

ARG VERSION

SHELL ["/bin/bash", "-c"]

RUN set -x \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       git \
       wget ca-certificates \
       libx11-6 libfreetype6 libxrender1 libfontconfig1 libxext6 \
    && wget "https://www.segger.com/downloads/embedded-studio/Setup_EmbeddedStudio_ARM_v${VERSION//.}_linux_x64.tar.gz" -O /tmp/ses.tar.gz \
    && tar xaf /tmp/ses.tar.gz --strip-components=1 -C /tmp \
    && echo "yes" | DISPLAY=:1 /tmp/install_segger_embedded_studio --copy-files-to /opt/ses \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME /src/
WORKDIR /src/
ENV PATH=/opt/ses/bin:${PATH}
