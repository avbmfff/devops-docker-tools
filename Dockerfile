FROM maven:3.9.9-eclipse-temurin-17-alpine AS build

RUN apk add --no-cache curl bash maven && \
    rm -rf /var/cache/apk/*

WORKDIR /app

COPY pom.xml /app/
RUN mvn dependency:go-offline

COPY . /app
RUN mvn clean install -DskipTests

FROM openjdk:17-alpine

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY --from=build /app/target/*.jar /app/spring-petclinic-rest.jar

RUN chown appuser:appgroup /app/spring-petclinic-rest.jar

USER appuser

EXPOSE 9966

ENTRYPOINT ["java", "-jar", "spring-petclinic-rest.jar"]
