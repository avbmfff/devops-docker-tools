FROM system AS build

WORKDIR /app

COPY pom.xml /app/
RUN mvn dependency:go-offline

COPY . /app

RUN mvn clean install -DskipTests
