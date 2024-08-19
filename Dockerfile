FROM openjdk:21-jdk-slim  AS build
RUN apt update && apt install -y maven
WORKDIR /opt/SimpleWebServer
COPY app .
RUN mvn clean install

FROM alpine:latest
RUN apk update
RUN apk add openjdk21-jre
COPY --from=build /opt/SimpleWebServer/target/SimpleWebServer-1.0-SNAPSHOT-jar-with-dependencies.jar /opt/SimpleWebServer.jar
EXPOSE 8090
CMD ["java", "-jar", "/opt/SimpleWebServer.jar"]
