FROM nginx:mainline

# auto config
RUN mkdir -p /docker
ADD . /docker
RUN chmod +x /docker/start.sh && chmod +x /docker/auto-configs/* && cp -r /docker/config/* /etc/nginx/

# start
ENTRYPOINT ["/docker/start.sh"]
