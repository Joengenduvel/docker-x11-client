FROM alpine

ENV DISPLAY=10.0.75.1:0.0
ENV USER=dev
ENV GROUP=developers

RUN adduser -D dev \
 && addgroup developers \
 && addgroup $USER $GROUP \
 && chown -R $USER:$GROUP /home/$USER
 
VOLUME ["/home"]

RUN apk add --no-cache dbus libx11 firefox-esr ca-certificates openssl curl fontconfig ttf-dejavu \
 && update-ca-certificates \
 && ttfs=$(apk search -q ttf- | grep -v '\-doc') \
 && apk add --no-cache $ttfs \
 && rm -rf /var/cache/apk/*
