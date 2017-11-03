#!/bin/bash

set -e +x

apt-get update && apt-get install -y maven

echo $PATH

echo $mvn -version


pushd movie_fun_source
  echo "Packaging JAR"
   mvn clean package -DskipTests
popd


find movie_fun_source/target -type f -name *.jar -exec cp "{}" package-output/movie_fun.jar \;

echo "Done packaging"
exit 0
