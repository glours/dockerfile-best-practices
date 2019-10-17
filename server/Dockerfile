FROM debian:buster

# Install dependencies
RUN apt-get update -y
RUN apt-get install -y openjdk-11-jdk

# Install server
COPY . /workdir/server
WORKDIR /workdir/server
RUN ./mvnw package

EXPOSE 8080

CMD ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/workdir/server/target/bestpractices-0.0.1-SNAPSHOT.jar"]
