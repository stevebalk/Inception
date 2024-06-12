FROM alpine:3.20

ENTRYPOINT [ "chmod", "-R", "777", "/app" ]