FROM node:22-slim

RUN npm install -g joplin

COPY entrypoint.sh /entrypoint.sh
COPY config.sh /config.sh
COPY syncloop.sh /syncloop.sh

EXPOSE 41184
VOLUME ["/joplin-profile"]

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "server", "start" ]
