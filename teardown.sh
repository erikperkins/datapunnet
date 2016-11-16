#!/bin/bash
pids=apps.pid
while read -r line
do
  name="$line"
  kill -9 "$line"
done < $pids
cat /dev/null > $pids
