#!/bin/bash

su vagrant -l -c "consul agent -server -bootstrap-expect 3 -data-dir /tmp/consul -node=server-1 -bind=172.20.20.10 -client=172.20.20.10 -ui-dir ui -config-dir /etc/consul.d >& /home/vagrant/consul.log < /home/vagrant/consul.log &" 
