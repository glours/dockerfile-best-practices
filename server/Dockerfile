FROM openjdk:13.0.1-slim-buster AS builder

# Install server
WORKDIR /workdir/server
COPY .mvn /workdir/server/.mvn
COPY pom.xml /workdir/server/pom.xml
COPY mvnw /workdir/server/mvnw
RUN ./mvnw dependency:go-offline

COPY src /workdir/server/src
RUN ./mvnw install
RUN mkdir -p target/dependency
WORKDIR /workdir/server/target/dependency
RUN jar -xf ../*.jar


FROM openjdk:11-jre-slim

EXPOSE 8080
VOLUME /tmp
ARG DEPENDENCY=/workdir/server/target/dependency
COPY --from=builder ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=builder ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=builder ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.docker.dockerfile.bestpractices.BestpracticesApplicationKt"]