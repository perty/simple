# Simple

A simple microservice with Spring boot and Elm. Database migration using Flyway. Deploy to AWS.

## Building the service

In `src/main/elm`:
1. `npm install`
2. `npm dist`

In root directory (this directory):
1. Start the db only: `docker compose up simple-db --detach`
2. `mvn package`
3. Start the service: `spring_profiles_active=dev java -jar target/simple-0.0.1-SNAPSHOT.jar`
4. Open [http://localhost:5000/](http://localhost:5000/)

## Build service for running in Docker

`docker compose build`

## Run containers

`docker compose up`

Starts the service in a container and a database in another.

