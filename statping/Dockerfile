FROM ghcr.io/statping-ng/statping-ng:0.91.0

RUN mkdir /default
COPY --chmod=755 config.yml /default/config.yml
COPY --chmod=755 statping.db /default/statping.db
COPY --chmod=755 run.sh /run.sh

CMD ["/bin/sh", "/run.sh"]
