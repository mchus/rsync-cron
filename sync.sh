#!/bin/bash

PIDFILE=~/backup/.rsync.pid
SHAREPATH=/Volumes/homes-1

if [ -f $PIDFILE ]
then
  PID=$(cat $PIDFILE)
  ps -p $PID > /dev/null 2>&1
  if [ $? -eq 0 ]
  then
    echo "Process already running"
    exit 1
  else
    ## Process not found assume not running
    echo $$ > $PIDFILE
    if [ $? -ne 0 ]
    then
      echo "Could not create PID file"
      exit 1
    fi
  fi
else
  echo $$ > $PIDFILE
  if [ $? -ne 0 ]
  then
    echo "Could not create PID file"
    exit 1
  fi
fi
rsync --exclude '.Trashes' --exclude '.Spotlight-V100' --exclude '.fseventsd' --exclude '.rsync.pid' --checksum --archive --delete ~ $SHAREPATH/.backup

rm $PIDFILE
