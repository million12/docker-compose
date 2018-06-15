FROM docker

ENV DOCKER_COMPOSE_VERSION=1.21.2

RUN apk update \
  && apk add py-pip curl jq \
  && pip install --upgrade pip \
  && pip install "docker-compose==$DOCKER_COMPOSE_VERSION"
