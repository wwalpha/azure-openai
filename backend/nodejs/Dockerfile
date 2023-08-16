# Build Stage
FROM node:16 as build-stage
WORKDIR /app

COPY . .

RUN yarn install && yarn build

# Release Stage
FROM node:16-alpine
WORKDIR /app

COPY --from=build-stage /app/dist/ ./
COPY package.json .

RUN yarn install --production --no-lockfile

EXPOSE 8080

# Entry Point
ENTRYPOINT ["yarn", "start"]