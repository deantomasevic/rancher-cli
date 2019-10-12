FROM docker:stable

ENV RANCHER_VERSION "v2.2.0"
ENV KUBECTL_VERSION "v1.16.0"

# Install extra package
RUN apk --update add curl tar bash build-base && \
    rm -rf /var/cache/apk/*

# Install Rancher cli
RUN curl -sL https://releases.rancher.com/cli2/${RANCHER_VERSION}/rancher-linux-amd64-${RANCHER_VERSION}.tar.gz \
    | tar -zx -C /tmp && \
    mv /tmp/rancher-${RANCHER_VERSION}/rancher /usr/bin/

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin/kubectl

CMD ["/bin/sh"]
