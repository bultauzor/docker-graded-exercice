FROM alpine:latest
RUN apk update
RUN apk add git wget
RUN wget https://cdn.azul.com/zulu/bin/zulu17.52.17-ca-jdk17.0.12-linux_musl_x64.tar.gz -O java.tar.gz
RUN tar -xf java.tar.gz
RUN mv zulu17* /jdk
ENV JAVA_HOME=/jdk
RUN git clone https://github.com/Corpauration/cyrel-sync
WORKDIR cyrel-sync
RUN git clone https://github.com/Corpauration/cy-celcat
COPY patch patch
RUN git apply patch
RUN ./gradlew jar --no-daemon


FROM registry.access.redhat.com/ubi8/openjdk-17:1.14
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en'
COPY --from=0 --chown=185 /cyrel-sync/build/libs/cyrel-sync*.jar /deployments/cyrel-sync.jar
COPY courses.json /courses.json
EXPOSE 8080
USER 185
ENV AB_JOLOKIA_OFF=""
ENV JAVA_APP_JAR="/deployments/cyrel-sync.jar"
