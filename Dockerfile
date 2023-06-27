FROM ghcr.io/socialgouv/kontinuous:v1 as kontinuous

FROM ghcr.io/socialgouv/docker/nginx:7.0.1

COPY --from=kontinuous /usr/local/bin /usr/local/bin

ARG COMMIT_SHA
ENV COMMIT_SHA $COMMIT_SHA

RUN echo "hello, world #$COMMIT_SHA" > /usr/share/nginx/html/index.html
