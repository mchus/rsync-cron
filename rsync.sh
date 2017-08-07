#!/bin/bash

PATH_FROM=/data/from
PATH_TO=/data/to
PIDFILE=/rsync.pid

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
rsync --exclude '.Trashes' --exclude '.Spotlight-V100' --exclude '.fseventsd' --exclude 'rsync.pid' --checksum --archive --delete $PATH_FROM $PATH_TO
rm $PIDFILE
