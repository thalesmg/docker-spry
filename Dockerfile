FROM ubuntu:17.10

RUN apt update -qq && \
    apt install -y -qq curl gcc libsnappy-dev git xz-utils

RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN curl https://nim-lang.org/choosenim/init.sh -sSf | sh -s -- -y

ENV PATH="/root/.nimble/bin:${PATH}"

WORKDIR /root

ARG SPRY_COMMIT_HASH=fe6b31af7a20f3457e79bbe48254691ad4462da5

RUN git clone https://github.com/gokr/spry.git && \
    cd spry && \
    git checkout ${SPRY_COMMIT_HASH} && \
    nimble install -y

CMD ispry
