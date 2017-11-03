#!/bin/bash

set -e +x

apt-get update && apt-get install -y maven

echo $PATH

echo $mvn -version


pushd movie_fun_source
  echo "Packaging JAR"
   MOVIE_FUN_URL=http://moviefun-muthamil.apps.cumuluslabs.io mvn test
popd


echo "Done Testing”
exit 0