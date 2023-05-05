FROM ubuntu:22.04

# SECURITY ubuntu generates host keys as part of installation. though, this
# technically isn't an issue for us since this service will only be used within
# a node, we should consider not including these.
RUN apt-get update && apt-get install -y \
    openssh-server \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password waggle

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
