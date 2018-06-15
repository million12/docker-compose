# Docker with docker-compose
[![pipeline status](https://gitlab.bsapps.net/docker/docker-compose/badges/master/pipeline.svg)](https://gitlab.bsapps.net/docker/docker-compose/commits/master)

Based on official `docker`, but with `docker-compose` tool (and few others, e.g. curl) installed inside.

## Usage

When you want to keep CI builds identical to these on local developer machine, you probably will keep everything in `docker-compose.yml`, so the developer can easily do `docker-compose build` and `docker-compose up` without worrying about anything.

Then you want to use the same setup on CI environment. Here's how it could look like:

.gitlab-ci.yml:
```bash
my-build-job:
  image: docker22.bs.lan/docker/docker-compose:1.21.2
  script:
    - export DOCKER_IMAGE_NAME="docker22.bs.lan/blackswan/fe-project-name:v${CI_PIPELINE_ID}"
    - docker-compose build
```

And example `docker-compose.yml` might look like this:
```yaml
version: '3'
services:
  fe-project-name:
#    image: docker22.bs.lan/blackswan/fe-project-name:v43
    image: ${DOCKER_IMAGE_NAME:-fe-project-name} # Use env set in CI - or fallback to default
    build:
      context: .
      dockerfile: scripts/docker/Dockerfile
    ports:
      - '4780:80' # export the app locally on :port
```

--
