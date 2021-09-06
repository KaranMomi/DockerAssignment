FROM openjdk:8-jdk-slim
COPY target/*.jar /tmp/programe.jar
WORKDIR /tmp
CMD ["java", "-jar", "my-app.jar"]
