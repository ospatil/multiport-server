#!/bin/bash

# handle Ctrl+C to kill the subprocesses
trap "kill -TERM $PID_LIST; exit" INT

WORK_DIR=$(pwd)

# start http servers
ncat -lk 8443 --keep-open < $WORK_DIR/responses/8443.http &
ncat -lk 8444 --keep-open < $WORK_DIR/responses/8444.http &
ncat -lk 8446 --keep-open < $WORK_DIR/responses/8446.http &
ncat -lk 9000 --keep-open < $WORK_DIR/responses/9000.http &
ncat -lk 9001 --keep-open < $WORK_DIR/responses/9001.http &

# start tcp server that hands out fortune cookies
ncat -lk 8089 --keep-open --send-only --exec "/usr/games/fortune" &

echo "Listening on HTTP 8443, 8444, 8446, 9000, 9001 and TCP 8089 ports"

# save the PID of the subprocesses
PID_LIST="$!"

wait

exit 0
