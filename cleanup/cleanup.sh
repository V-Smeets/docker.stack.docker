#!/bin/sh -x
#
while sleep 10
do
	date
	docker container ls
done
