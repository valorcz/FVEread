FROM docker.io/alpine:latest

# Labels definition
LABEL maintainer="petos@petos.eu"
LABEL description="Simple FVE toolkit"

# Add important components to the base image
RUN apk add --no-cache bash \
                       jq

# Add our own user, so that we don't work under root
RUN addgroup -S fve && adduser -S -D fve -G fve

# Switch to the unprivileged user
USER fve

# Setup the actual FVE tooling
WORKDIR /opt/fve
ADD scripts /opt/fve/scripts
ADD FVErc.example /opt/fve/.FVErc

CMD ["/hello"]
