#!/bin/sh -e
#

# Delay random 1 to 5 minutes.
sleep $((60 + ( $RANDOM % 240 ) ))

docker system prune --force --filter until=168h --all

volumeNames=`docker volume ls --filter 'dangling=true' --filter 'name=.{64}' --format '{{.Name}}'`
[ -n "$volumeNames" ] \
&& docker volume rm $volumeNames

exit 0
