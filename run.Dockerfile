ARG OPENJDK_VERSION
FROM openjdk:${OPENJDK_VERSION} AS run

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY --from=build /app/target/*.jar /app/spring-petclinic-rest.jar

RUN chown appuser:appgroup /app/spring-petclinic-rest.jar

USER appuser

EXPOSE ${PETCLINIC_PORT}

ENTRYPOINT ["java", "-jar", "spring-petclinic-rest.jar"]

# Очистка кеша
RUN rm -rf /var/cache/apk/*
