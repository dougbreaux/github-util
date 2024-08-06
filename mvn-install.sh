#!/bin/bash

# from https://stackoverflow.com/a/73791751/796761
version=$1
if [ -z $version ] ; then echo "specify version" ; exit 1 ; fi

url="https://dlcdn.apache.org/maven/maven-3/${version}/binaries/apache-maven-${version}-bin.tar.gz"
echo $url
curl -O $url

tarFile="apache-maven-${version}-bin.tar.gz"
echo $tarFile
sudo tar -xf $tarFile -C /opt/
