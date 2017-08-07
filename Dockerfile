FROM alpine:3.6

LABEL maintainer="Mikhail Chusavitin chusavitin@gmail.com"
LABEL version="1.1"
# Install rsynbc and dcron.
RUN apk update \
 && apk upgrade \
 && apk add --no-cache \
            rsync \
            dcron \
 && rm -rf /var/cache/apk/*

#create data dirs
RUN mkdir -p /data/from \
 && mkdir -p /data/to

#some cron stuff
RUN mkdir -p /var/log/cron \
 && mkdir -m 0644 -p /var/spool/cron/crontabs \
 && touch /var/log/cron/cron.log \
 && mkdir -m 0644 -p /etc/cron.d

#get rsync PID script for preventing multiple rsync launches
ADD https://raw.githubusercontent.com/mchus/arb/docker-version/rsync.sh /

RUN chmod +x /rsync.sh

#add crontab record for rsync script
RUN crontab -l | { cat; echo "* * * * * sh /rsync.sh"; } | crontab -

#define volume mounts
VOLUME /data/from
VOLUME /data/to

#3.2.1. launch
CMD crond -s /var/spool/cron/crontabs -b -L /var/log/cron/cron.log "$@" && tail -f /var/log/cron/cron.log
