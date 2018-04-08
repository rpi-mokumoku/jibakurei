#!/bin/bash
cd `dirname $0`

docker-compose down

cp /etc/hosts.org /etc/hosts

