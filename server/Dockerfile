FROM openjdk:13.0.1-slim-buster AS builder

# Install server
COPY . /workdir/server
WORKDIR /workdir/server
RUN ./mvnw package

FROM openjdk:11-jre-slim

EXPOSE 8080

COPY --from=builder /workdir/server/target/bestpractices-0.0.1-SNAPSHOT.jar /bestpractices.jar

CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/bestpractices.jar"]
