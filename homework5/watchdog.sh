#!/bin/bash

LOCK_FILE=./watchdog-lock
if [ -f $LOCK_FILE ]; then
  echo "Watchdog already running"
  exit SIGABRT
fi

touch $LOCK_FILE

croncmd="./monitoring.sh > /home/vagrant/testcrone.log"
cronjob="* * * * * $croncmd"

set_cron(){
  ( crontab -l | grep -v -F "$croncmd" ; echo "$cronjob" ) | crontab -
}
remove_cron(){
  ( crontab -l | grep -v -F "$croncmd" ) | crontab -
}

set_cron
trap 'remove_cron; rm -f "$LOCK_FILE"; exit $?' INT TERM EXIT

sleep 125

remove_cron

rm -f $LOCK_FILE
trap - INT TERM EXIT

