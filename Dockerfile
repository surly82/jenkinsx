FROM registry.access.redhat.com/ubi8/ubi:8.0

RUN JX_VERSION=$(curl --silent "https://github.com/jenkins-x/jx/releases/latest" | sed 's#.*tag/\(.*\)\".*#\1#') && \
    curl -L "https://github.com/jenkins-x/jx/releases/download/$JX_VERSION/jx-linux-amd64.tar.gz" | \
    tar xzv "jx"

USER 1001

RUN mv jx /usr/bin/jx

ENTRYPOINT ["jx", "version"]