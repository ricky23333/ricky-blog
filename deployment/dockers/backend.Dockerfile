FROM node:20.10.0-alpine
WORKDIR /app
COPY packages/backend /app
RUN rm -rf node_modules
RUN yarn install
CMD ["yarn", "dev"]

EXPOSE 6001