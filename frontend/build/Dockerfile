# syntax=docker/dockerfile:1

FROM node:20.16-alpine as base
WORKDIR /app
RUN npm install -g pnpm && rm -rf /root/.npm

COPY package.json pnpm-lock.yaml ./
RUN pnpm install --shamefully-hoist --frozen-lockfile --reporter append-only && rm -rf /root/.pnpm

FROM base as development
CMD ["pnpm", "run", "dev"]

FROM base as build
COPY . .
RUN pnpm run build

FROM scratch as production
COPY --from=build /dist .
