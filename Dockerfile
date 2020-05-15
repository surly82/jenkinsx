#FROM registry.access.redhat.com/ubi8/ubi:8.0
FROM centos:7

RUN JX_VERSION=$(curl --silent "https://github.com/jenkins-x/jx/releases/latest" | sed 's#.*tag/\(.*\)\".*#\1#') && \
    curl -L "https://github.com/jenkins-x/jx/releases/download/$JX_VERSION/jx-linux-amd64.tar.gz" | \
    tar xzv "jx"
USER root

RUN mv jx /usr/local/bin

USER 1001

#RUN mv jx /usr/bin/jx

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/jx", "install", "--provider=openshift"]