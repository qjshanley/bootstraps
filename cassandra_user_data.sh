#!/bin/bash
roll=cassandra-scale-test
cd /tmp
netstat -nr > /tmp/netstat.out
ping -c 20 www.google.com > /tmp/ping_google.out
apt-get update -y; apt-get upgrade -y; apt-get install -y unzip
wget https://github.com/qjshanley/cassandra_scale_test/archive/master.zip
unzip master.zip
bash cassandra_scale_test*/cassandra_bootstrap
