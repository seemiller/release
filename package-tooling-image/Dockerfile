FROM bitnami/golang:1.17

ARG PACKAGE_TOOLS_TAG_OVERRIDE=main
ENV PACKAGE_TOOLS_TAG=${PACKAGE_TOOLS_TAG_OVERRIDE}

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update && \
    apt-get install -y \
        docker-ce=${DOCKER_CE_VERSION} \
        docker-ce-cli=${DOCKER_CE_CLI_VERSION} \
        containerd.io=${CONTAINERD_VERSION} && \
    rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://get.docker.com/ | sh

RUN go install github.com/vmware-tanzu/build-tooling-for-integrations/package-tools@main

COPY build-packages.sh /build-packages.sh
ENTRYPOINT ["/build-packages.sh"]
