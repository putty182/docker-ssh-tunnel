FROM alpine
MAINTAINER putty182

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*

CMD sh -c /init.sh
