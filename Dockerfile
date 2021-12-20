FROM debian:bullseye-slim AS base

FROM base AS downloder

RUN apt-get update \
 && apt-get install --no-install-recommends -y \
    curl \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/* \
 && curl -Lo /tmp/get-pip.py https://bootstrap.pypa.io/pip/2.7/get-pip.py \
 && curl -Lo /tmp/vol.tar.gz https://github.com/volatilityfoundation/volatility/archive/refs/tags/2.6.1.tar.gz \
 && tar zxf /tmp/vol.tar.gz -C /tmp


FROM base

RUN apt-get update \
 && apt-get install --no-install-recommends -y \
    gcc \
    python2 \
    yara=4.0.5-1 \
    python2.7-dev \
 && rm -rf /var/lib/apt/lists/*

COPY --from=downloder /tmp/get-pip.py /get-pip.py

RUN python2 get-pip.py \
 && rm get-pip.py 

RUN pip2 install --no-cache-dir \
    yara-python==4.0.5 \
    distorm3==3.4.4 \
    pycrypto \
    pillow \
    openpyxl \
    ujson

COPY --from=downloder /tmp/volatility-2.6.1 /vol
WORKDIR /vol
RUN python2.7 setup.py install

USER volatility
