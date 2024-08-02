#!/bin/sh

apk update
apk add --no-cache docker docker-cli-compose iptables-legacy

rm /sbin/iptables && ln -s /sbin/iptables-legacy /sbin/iptables
rm /sbin/ip6tables && ln -s /sbin/ip6tables-legacy /sbin/ip6tables

rc-update add docker default
rc-service docker start

sleep 10
docker info
docker version
docker compose version