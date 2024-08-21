FROM openjdk:21-jdk-slim  AS build
RUN apt update && apt install -y maven
WORKDIR /opt/SimpleWebServer
COPY ./app .
RUN mvn clean install

FROM gcr.io/distroless/java17-debian12:latest
COPY --from=build /opt/SimpleWebServer/target/SimpleWebServer-1.0-SNAPSHOT-jar-with-dependencies.jar /opt/SimpleWebServer.jar
EXPOSE 8090
CMD ["/opt/SimpleWebServer.jar"]
