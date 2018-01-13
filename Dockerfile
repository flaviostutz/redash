FROM redash/redash:latest

ADD start.sh /

ENTRYPOINT [ "/start.sh" ]
