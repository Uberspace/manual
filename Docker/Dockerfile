FROM node:10
RUN yarn global add write-good
COPY Docker/entrypoint.sh /usr/local/bin/entrypoint.sh
WORKDIR /app
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
