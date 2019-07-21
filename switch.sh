#!/bin/bash

# bash switch.sh bind_port port1 port2 ...
#

sed -i 's/bind \*:[0-9]*/bind \*:'$1'/g' haproxy_conf/haproxy.cfg

sed -i '/server web.*/d' haproxy_conf/haproxy.cfg
count=1;
for i in $@; do
    if (($count == 1))
    then
        count=2;
    else
        echo '    server web03 127.0.0.1:'$i' check' >> haproxy_conf/haproxy.cfg;
    fi
done;

docker kill -s HUP $(docker-compose ps -q balancer)
