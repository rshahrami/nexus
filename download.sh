#!/bin/bash

distribute=jammy
architecture=amd64
version=$(cat $PWD/nexus-role/vars/main.yml | grep -i version | cut -d ":" -f 2 | sed -e 's/^[[:space:]]*//')


## download all install docker package
wget https://download.docker.com/linux/ubuntu/dists/$distribute/stable/binary-$architecture/Packages -O packages
cat packages | grep Package | cut -d ":" -f 2 | cut -d " " -f 2 | uniq > packages_name

while read line;
do 
    packageFile=$(cat packages | grep Filename | cut -d ":" -f 2 | cut -d " " -f 2 | cut -d "/" -f 6 |grep $line | tail -n1)
    curl -o $PWD/nexus-role/files/$packageFile https://download.docker.com/linux/ubuntu/dists/$distribute/pool/stable/$architecture/$packageFile 
done < packages_name

sudo rm -rf package*


## download nexus3 docker images
docker pull sonatype/nexus3:$version
docker save sonatype/nexus3:$version > $PWD/nexus-role/files/sonatype-nexus3-$version.tar


## download java
curl -o $PWD/nexus-role/files/jdk-8u221-linux-x64.tar.gz https://files-cdn.liferay.com/mirrors/download.oracle.com/otn-pub/java/jdk/8u221-b11/jdk-8u221-linux-x64.tar.gz 