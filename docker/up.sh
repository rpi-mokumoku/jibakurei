#!/bin/bash
cd `dirname $0`

docker-compose up -d

cp /etc/hosts.org /etc/hosts

ids=$(docker ps -q)

echo "# docker containers" >> /etc/hosts
while read id
do
  _host=$(docker inspect --format='{{.Name}}' ${id})
  host=${_host:1}
  ip=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${id})

  echo "# container_id:${id}" >> /etc/hosts
  echo "${ip} ${host}" >> /etc/hosts
done <<END
$ids
END

