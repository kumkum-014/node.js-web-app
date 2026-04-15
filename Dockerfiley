FROM node:16-alpine
COPY --chown=node:node . /opt/app
WORKDIR /opt/app/server
RUN npm i && \
    npm run build && \
    npm prune --production
ENV NODE_ENV production
EXPOSE 8000
USER node
CMD ["node", "./dist/bundle.js"]

