#!/bin/bash
roll=cassandra-scale-test
cd /tmp

# add necessary repositories
add-apt-repository -y ppa:webupd8team/java
echo "deb http://www.apache.org/dist/cassandra/debian 21x main" | tee -a /etc/apt/sources.list.d/cassandra.sources.list
curl https://www.apache.org/dist/cassandra/KEYS | apt-key add -

# update/upgrade apt-get
apt-get update -y
apt-get upgrade -y

# install java
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections
apt-get install -y oracle-java8-installer

# install tomcat 
ln -s /usr/lib/jvm/java-8-oracle /usr/lib/jvm/default-java
apt-get install -y tomcat7

# install other software
apt-get install -y python cassandra

# clone repositories
git clone -b 3.x https://github.com/Netflix/Priam.git
