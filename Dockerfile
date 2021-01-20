FROM ubuntu:20.04

RUN apt update -qq && \
        DEBIAN_FRONTEND=noninteractive apt install -y -qq curl gcc libsnappy-dev git xz-utils \
        pkg-config librocksdb-dev libgtk-3-dev && \
        apt clean

RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN curl https://nim-lang.org/choosenim/init.sh -sSf | sh -s -- -y

ENV PATH="/root/.nimble/bin:${PATH}"

WORKDIR /root

ARG SPRY_COMMIT_HASH=098da7bb34a9113d5db5402fecfc76b1c3fa3b36

RUN git clone https://github.com/gokr/spry.git && \
    cd spry && \
    git checkout ${SPRY_COMMIT_HASH} && \
    nimble install -y

CMD ispry
