FROM docker:stable

ENV RANCHER_CLI_VERSION "v2.2.0"

# Install extra package
RUN apk --update add curl tar bash && \
    rm -rf /var/cache/apk/*

# Install Rancher cli
RUN curl -sL https://releases.rancher.com/cli2/${RANCHER_VERSION}/rancher-linux-amd64-${RANCHER_VERSION}.tar.gz \
    | tar -zx -C /tmp && \
    mv /tmp/rancher-${RANCHER_CLI_VERSION}/rancher /usr/bin/

CMD ["/bin/sh"]
