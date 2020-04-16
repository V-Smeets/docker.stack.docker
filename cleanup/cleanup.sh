#!/bin/sh
#

# Every hour +/- 1 minute
while sleep $((3540 + ( $RANDOM % 120 ) ))
do
	docker system prune --force --filter until=168h --all
	docker volume prune --force
done
