#!/bin/bash

set -e +x

echo $PATH
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

export M2_HOME=/usr/local/apache-maven/apache-maven-3.3.9
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xms256m -Xmx512m"
export PATH=$M2:$PATH

pushd movie_fun_source
  echo "Packaging JAR"
   ./mvnw clean package -DskipTests
popd

jar_count=`find movie_fun_source/target -type f -name *.jar | wc -l`

if [ $jar_count -gt 1 ]; then
  echo "More than one jar found, don't know which one to deploy. Exiting"
  exit 1
fi

find movie_fun_source/target -type f -name *.jar -exec cp "{}" package-output/movie_fun.jar \;

echo "Done packaging"
exit 0
