FROM docker

ENV DOCKER_COMPOSE_VERSION=1.21.2

RUN apk update \
  `# Note: gettext to have envsubst tool available...` \
  `# Note: jq for easy JSON manipulation and parsing...` \
  && apk add py-pip curl gettext jq \
  && pip install --upgrade pip \
  && pip install "docker-compose==$DOCKER_COMPOSE_VERSION"
