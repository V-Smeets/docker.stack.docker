#!/bin/sh
#

# Every hour +/- 1 minute
while sleep $((3540 + ( $RANDOM % 120 ) ))
do
	docker system prune --force --filter until=168h --all
	volumeNames=`docker volume ls --filter 'dangling=true' --filter 'name=.{64}' --format '{{.Name}}'`
	[ -n "$volumeNames" ] \
	&& docker volume rm $volumeNames
done
