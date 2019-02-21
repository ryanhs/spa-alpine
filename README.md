# SPA Alpine

[![](https://images.microbadger.com/badges/image/ryanhs/spa-alpine.svg)](https://microbadger.com/images/ryanhs/spa-alpine "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/ryanhs/spa-alpine.svg)](https://microbadger.com/images/ryanhs/spa-alpine "Get your own version badge on microbadger.com")

[https://hub.docker.com/r/ryanhs/spa-alpine](https://hub.docker.com/r/ryanhs/spa-alpine)

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

## Security Headers

nginxconfig.io general security headers disabled in this docker,
but if you want to add it, then you can append it in `/etc/nginx/nginxconfig.io/general.conf`

**Example:**

```
add_header X-Frame-Options "SAMEORIGIN" always;
add_header X-XSS-Protection "1; mode=block" always;
add_header X-Content-Type-Options "nosniff" always;
add_header Referrer-Policy "no-referrer-when-downgrade" always;
add_header Content-Security-Policy "default-src * data: 'unsafe-eval' 'unsafe-inline'" always;
```
