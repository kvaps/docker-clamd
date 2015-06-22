#!/bin/bash

log=/var/log/clamav/clamd.log

trap '{
    service clamd stop
}' EXIT

fresh_db()
{
    freshclam
    sleep 6h
    fresh_db
}

service clamd start
fresh_db & tail -f -n1 $log
