#!/bin/bash

echo '{"service": {"name": "web","tags": ["frontend", "web"],"address": "'"$1"'","port": 8000,"enableTagOverride": false,"checks": [{"name": "web server","http" : "http://localhost:8000/", "interval": "10s","timeout": "1s"  } ]   } }' > /etc/consul.d/service.json


su vagrant -l -c "nohup consul agent -data-dir /tmp/data/consul -join 172.20.20.10 -node=$2 -bind=$1 -config-dir /etc/consul.d >& /home/vagrant/consul.log < /home/vagrant/consul.log &" 


su vagrant -l -c "nohup python -m SimpleHTTPServer 8000 > /dev/null 2>&1 &"
