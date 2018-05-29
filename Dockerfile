FROM debian:stretch
    
ARG VERSION=devel
ENV PATH="${PATH}:/Nim/bin:/root/.nimble/bin"

RUN apt-get update && apt-get install -y \
    gcc \
    git \
    \
    && apt-get autoremove && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    \
    && git clone https://github.com/nim-lang/Nim.git \
    && cd Nim \
    && git checkout $VERSION \
    && git clone --depth 1 https://github.com/nim-lang/csources.git \
    && cd csources \
    && sh build.sh \
    && cd .. \
    && bin/nim c koch \
    && ./koch boot -d:release \
    && ./koch nimble -d:release