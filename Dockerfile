FROM node:22-slim

RUN npm install -g joplin

COPY entrypoint.sh /entrypoint.sh

EXPOSE 41184
VOLUME ["/joplin-profile"]

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "server", "start" ]
