#!/bin/bash
roll=cassandra-scale-test
cd /tmp
apt-get update -y; apt-get upgrade -y; apt-get install -y unzip
wget https://github.com/qub3r/aws/archive/master.zip
unzip ./aws-master.zip
bash ./aws-master/scripts/bootstraps/cassandra.sh
