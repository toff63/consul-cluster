#!/bin/bash

su vagrant -l -c "consul agent -server -bootstrap-expect 3 -join 172.20.20.10 -data-dir /tmp/consul -node=$2 -bind=$1 -config-dir /etc/consul.d >& /home/vagrant/consul.log < /home/vagrant/consul.log &" 
