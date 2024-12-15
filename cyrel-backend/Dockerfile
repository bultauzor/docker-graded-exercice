FROM alpine:latest
RUN apk update
RUN apk add git wget
RUN wget https://cdn.azul.com/zulu/bin/zulu17.52.17-ca-jdk17.0.12-linux_musl_x64.tar.gz -O java.tar.gz
RUN tar -xf java.tar.gz
RUN mv zulu17* /jdk
ENV JAVA_HOME=/jdk
RUN git clone https://github.com/Corpauration/cyrel-backend
WORKDIR cyrel-backend
COPY application.properties src/main/resources/application.properties
COPY V25__Fill_tables.sql src/main/resources/db/migration/V25__Fill_tables.sql
RUN rm src/main/kotlin/fr/corpauration/ExampleResource.kt src/test/kotlin/fr/corpauration/ExampleResourceTest.kt
RUN ./gradlew build --no-daemon
RUN apk add gzip
WORKDIR /
RUN wget https://packages.timber.io/vector/0.42.0/vector-0.42.0-x86_64-unknown-linux-gnu.tar.gz
RUN tar xvf vector-0.42.0-x86_64-unknown-linux-gnu.tar.gz
RUN rm vector-0.42.0-x86_64-unknown-linux-gnu.tar.gz
RUN mv vector-* vector


FROM registry.access.redhat.com/ubi8/openjdk-17:1.14
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en'
COPY --from=0 --chown=185 /cyrel-backend/build/quarkus-app/lib/ /deployments/lib/
COPY --from=0 --chown=185 /cyrel-backend/build/quarkus-app/*.jar /deployments/
COPY --from=0 --chown=185 /cyrel-backend/build/quarkus-app/app/ /deployments/app/
COPY --from=0 --chown=185 /cyrel-backend/build/quarkus-app/quarkus/ /deployments/quarkus/
COPY --from=0 --chown=185 /vector /vector
EXPOSE 8080
USER 0
RUN mkdir /logs
RUN chown 185:185 /logs
VOLUME /logs
USER 185
COPY vector.yml vector.yml
COPY run.bash run.bash
RUN mkdir -p vector/data
ENV AB_JOLOKIA_OFF=""
ENV JAVA_OPTS="-Dquarkus.http.host=0.0.0.0 -Djava.util.logging.manager=org.jboss.logmanager.LogManager"
ENV JAVA_APP_JAR="/deployments/quarkus-run.jar"

CMD ["bash", "run.bash"]
