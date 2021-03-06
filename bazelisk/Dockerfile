FROM ubuntu:18.04

WORKDIR /workspace

ADD https://github.com/bazelbuild/bazelisk/releases/download/v1.3.0/bazelisk-linux-amd64 /usr/local/bin/bazel

RUN chmod +x /usr/local/bin/bazel \
  && apt-get update \
  && apt-get dist-upgrade -y \
  && apt-get install -y build-essential ca-certificates

RUN apt-get update \
  && apt-get install --no-install-recommends -y git ssh

RUN apt-get update \
  && apt-get install -y curl \
  && export DOCKER_VERSION=$(curl --silent --fail --retry 3 https://download.docker.com/linux/static/stable/x86_64/ | grep -o -e 'docker-[.0-9]*\.tgz' | sort -r | head -n 1) \
  && DOCKER_URL="https://download.docker.com/linux/static/stable/x86_64/${DOCKER_VERSION}" \
  && echo Docker URL: $DOCKER_URL \
  && curl --silent --show-error --location --fail --retry 3 --output /tmp/docker.tgz "${DOCKER_URL}" \
  && ls -lha /tmp/docker.tgz \
  && tar -xz -C /tmp -f /tmp/docker.tgz \
  && mv /tmp/docker/* /usr/bin \
  && rm -rf /tmp/docker /tmp/docker.tgz \
  && which docker \
  && (docker version || true)
  
RUN apt-get update \
  && apt-get install -y python3 \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python

ENTRYPOINT [ "/usr/local/bin/bazel" ]
