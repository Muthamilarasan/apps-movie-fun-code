#!/bin/bash

set -e +x

apt-get update && apt-get install -y maven

echo $PATH

echo $mvn -version


pushd movie_fun_source
  echo "Packaging JAR"
   mvn clean package -DskipTests
popd


echo $(ls ./movie_fun_source/target/*.*)

find movie_fun_source/target -type f -name *.war -exec cp "{}" package-output/movie_fun.war \;

echo "Done packaging"
exit 0
