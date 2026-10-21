# Stage 1: use Amazon Corretto JDK 21 to build the application
FROM amazoncorretto:21 AS build
WORKDIR /workspace

RUN dnf install -y findutils && dnf clean all

COPY . .
RUN chmod +x gradlew && ./gradlew --no-daemon clean test bootJar

# Stage 2: run the JAR in a separate Java 21 image
FROM amazoncorretto:21-alpine-jdk
WORKDIR /app

COPY --from=build /workspace/build/libs/inventory-api-0.1.0.jar /app/app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
