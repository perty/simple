#!/bin/bash
set -e

# Build the frontend and place it in the service's static pages.

(cd src/main/elm; npm install ; npm dist)

# Start a local database in docker so that the tests can work.

docker compose up simple-db --detach

# Build and test the service.

mvn package

# Start the service.

spring_profiles_active=dev java -jar target/simple-0.0.1-SNAPSHOT.jar

# Open the browser.

open http://localhost:5000/



