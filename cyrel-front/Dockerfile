FROM debian:bookworm-slim
RUN apt update
RUN apt install -y --no-install-recommends git wget curl unzip xz-utils zip bash python3 ca-certificates
RUN rm -rf /var/lib/apt/lists/*
RUN adduser --disabled-password -u 1000 user
RUN mkdir /rootless
RUN chown 1000:1000 -R /rootless
WORKDIR /rootless
USER user
RUN git clone https://github.com/flutter/flutter.git
RUN cd flutter ; git reset d211f42 --hard
ENV PATH="/rootless/flutter/bin:${PATH}"
RUN flutter config --enable-web
RUN git clone https://github.com/Corpauration/cyrel
WORKDIR /rootless/cyrel
RUN git reset 52e29ef242c097af647310b813b0ff57e6f34cbc --hard
COPY constants.dart /rootless/cyrel/lib/constants.dart
RUN flutter build web --web-renderer html --profile

FROM httpd:2.4
COPY --from=0 /rootless/cyrel/build/web /usr/local/apache2/htdocs/
RUN apt update
RUN apt install -y curl
RUN rm -rf /var/lib/apt/lists/*
