FROM nginx:alpine as base

COPY ./build/snippets /etc/nginx/snippets

WORKDIR /app

FROM base as development

COPY ./build/development/conf.d /etc/nginx/conf.d

FROM base as production

COPY ./build/production/conf.d /etc/nginx/conf.d

HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD wget -qO- http://127.0.0.1/health || exit 1