#!/bin/bash

for pid in `ps -ef | grep   -v 'grep' | grep gunicorn | awk '{print $2}'`
do
	kill -9 ${pid}
done