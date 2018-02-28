FROM debian:stretch

RUN apt-get update && apt-get install -y \
    gcc \
    git \
    \
    && apt-get autoremove && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    \
    && git clone https://github.com/nim-lang/Nim.git \
    && cd Nim \
    && git clone --depth 1 https://github.com/nim-lang/csources.git \
    && cd csources \
    && sh build.sh \
    && cd .. \
    && bin/nim c koch \
    && ./koch boot -d:release \
    && ln -s /Nim/bin/nim /usr/local/bin/nim \
    && ./koch nimble -d:release \
    && ln -s /Nim/bin/nimble /usr/local/bin/nimble