FROM alpine:3.20

RUN mkdir /app

ENTRYPOINT [ "rm", "-rf", "/app" ]