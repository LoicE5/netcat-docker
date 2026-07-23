FROM alpine:latest
RUN apk add --no-cache netcat-openbsd libcap \
 && setcap cap_net_bind_service=+ep "$(readlink -f "$(command -v nc)")"
USER nobody
ENTRYPOINT ["nc"]
