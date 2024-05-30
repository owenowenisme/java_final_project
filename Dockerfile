FROM openjdk:17-jdk-slim

WORKDIR /app

COPY ./urlshortener /app

# Ensure line endings are converted to Unix format
RUN apt-get update && apt-get install -y dos2unix
RUN dos2unix ./gradlew

RUN chmod +x ./gradlew
RUN ./gradlew bootJar

CMD ["java", "-jar", "build/libs/springboot-shorturl-v1.jar"]