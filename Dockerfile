# docker run -d command is asynchronous.
# so we need to add sleep 60 to the jenkinsfile to make sure the service is already running
# there is no sure way to check that the service is already running
FROM openjdk:8-jre
COPY build/libs/calculator-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]



