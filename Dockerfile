FROM maven:3.8.6-openjdk-11-slim as maven_builder
WORKDIR ./
RUN mvn package
FROM tomcat:9.0.0-jre8-alpine
COPY --from=maven_builder ./*.war /usr/local/tomcat/webapps
EXPOSE 8080
