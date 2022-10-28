FROM node:lts-alpine3.16 as frontend

COPY src src

RUN (cd src/main/elm ; npm ci; npm run dist)

FROM maven:3.8.6-eclipse-temurin-19 as build

COPY --from=frontend src src

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .

RUN mvn -DskipTests=true --batch-mode package

FROM eclipse-temurin:19-jre

COPY --from=build target/simple-0.0.1-SNAPSHOT.jar simple.jar

EXPOSE 5000

ENTRYPOINT ["java", "-jar", "simple.jar"]