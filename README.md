# SPA Alpine

This docker base image, `from nginx-alpine`, and add some config from `nginxconfig.io`.

**Only for http static serve**, if you need to do https, then better to put ssl termination at load balancer like haproxy/traefik.


## Example

Dockerfile:

```
FROM ryanhs/spa-alpine:latest
MAINTAINER You <you@youremail.com>

# app
COPY build /usr/share/nginx/html
```

## Example Create React App multi stage build

Dockerfile:

```
# build environment
FROM node:8.11 as builder

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app

ENV NODE_PATH=src/
RUN yarn && yarn build

# production environment
FROM ryanhs/spa-alpine:latest
MAINTAINER You <you@youremail.com>
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
```
