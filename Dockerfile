FROM quay.io/eduk8s/base-environment:master

COPY --chown=1001:0 . /home/eduk8s/

RUN mv /home/eduk8s/workshop /opt/workshop

ENV VERSION=1.6.2
RUN curl -sSL https://github.com/argoproj/argo-cd/releases/download/v${VERSION}/argocd-linux-amd64 -o /opt/eduk8s/bin/argocd && \ 
chmod +x /opt/eduk8s/bin/argocd

RUN fix-permissions /home/eduk8s