FROM node:22-bookworm-slim

WORKDIR /app

COPY package.json server.js ./
COPY public ./public

RUN mkdir -p /data/backups && chown -R node:node /app /data

USER node

ENV NODE_ENV=production
ENV PORT=3000
ENV DATA_DIR=/data
ENV BACKUP_DIR=/data/backups

EXPOSE 3000

CMD ["node", "server.js"]
