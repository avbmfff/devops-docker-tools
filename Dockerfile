FROM openjdk:17-alpine

RUN apk add --no-cache curl bash && \
    rm -rf /var/cache/apk/*

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY target/spring-petclinic-rest.jar /app/spring-petclinic-rest.jar

RUN chown appuser:appgroup /app/spring-petclinic-rest.jar

USER appuser

EXPOSE 9966

# Запуск приложения
ENTRYPOINT ["java", "-jar", "spring-petclinic-rest.jar"]
