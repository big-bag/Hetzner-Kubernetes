ARG ALPINE_VERSION=3.15.0
ARG OP_CLI_VERSION=1.12.3

FROM alpine:$ALPINE_VERSION
ARG OP_CLI_VERSION
ARG KUBECTL_VERSION
COPY submodules/kubespray/requirements.txt /
RUN apk add --update --no-cache python3 \
                                py3-pip \
                                gcc \
                                python3-dev \
                                musl-dev \
                                libffi-dev \
                                rust \
                                cargo \
                                openssl-dev \
                                py3-wheel
RUN python3 -m pip install -r requirements.txt && \
    find /usr/lib/ -name '__pycache__' -print0 | xargs -0 -n1 rm -rf
RUN apk add --update --no-cache curl && \
    curl -O -L https://cache.agilebits.com/dist/1P/op/pkg/v$OP_CLI_VERSION/op_linux_386_v$OP_CLI_VERSION.zip && \
    unzip op_linux_386_v$OP_CLI_VERSION.zip

FROM alpine:$ALPINE_VERSION
COPY --from=0 /usr/bin/ansible* /usr/bin/
COPY --from=0 /usr/lib/python3.9/site-packages/ /usr/lib/python3.9/site-packages/
COPY --from=0 /op /usr/bin/
RUN apk add --update --no-cache python3 \
                                openssh-client \
                                curl \
                                jq \
                                git \
                                expect && \
    python3 -m pip install hcloud \
                           kubernetes \
                           kubernetes-validate && \
    python3 -m compileall /usr/lib/python3.9/
WORKDIR /etc/ansible
