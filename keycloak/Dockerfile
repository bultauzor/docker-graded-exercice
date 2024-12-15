FROM keycloak/keycloak:26.0
COPY realm.json /opt/keycloak/data/import/cyrel.json
COPY --chmod=555 healthcheck /usr/bin/healthcheck
