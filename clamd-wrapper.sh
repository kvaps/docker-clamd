#!/bin/bash

log=/var/log/clamav/clamd.log

trap '{
   pkill "clamd"
}' EXIT

fresh_db()
{
    freshclam
    sleep 6h
    fresh_db
}

clamd
fresh_db &
tail -f -n1 $log
