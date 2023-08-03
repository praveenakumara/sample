FROM maven as build
WORKDIR /app
COPY . .
RUN mvn install

FROM tomcat:9.0.78-jre17-temurin-focal
COPY --from=build /app/target/praveen.war /usr/local/tomcat/webapps
CMD ["catalina.sh","run"]
