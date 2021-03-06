FROM alpine:edge

RUN apk add --no-cache bash postfix postfix-sqlite postfix-pcre rsyslog ca-certificates

COPY conf /etc/postfix
COPY rsyslog.conf /etc/rsyslog.conf

COPY start.sh /start.sh

CMD ["/start.sh"]