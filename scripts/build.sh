#!/bin/bash
set -e

(cd src/main/elm; npm install ; npm dist)

docker compose up simple-db --detach

mvn package

spring_profiles_active=dev java -jar target/simple-0.0.1-SNAPSHOT.jar

open http://localhost:5000/



