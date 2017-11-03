#!/bin/bash

set -e +x

apt-get install maven

echo $PATH

echo $mvn -version


pushd movie_fun_source
  echo "Packaging JAR"
   mvn clean package -DskipTests
popd

jar_count=`find movie_fun_source/target -type f -name *.jar | wc -l`

if [ $jar_count -gt 1 ]; then
  echo "More than one jar found, don't know which one to deploy. Exiting"
  exit 1
fi

find movie_fun_source/target -type f -name *.jar -exec cp "{}" package-output/movie_fun.jar \;

echo "Done packaging"
exit 0
