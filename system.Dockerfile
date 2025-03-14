FROM maven:3.9.9-eclipse-temurin-17-alpine AS system

WORKDIR /app

RUN mvn --version
