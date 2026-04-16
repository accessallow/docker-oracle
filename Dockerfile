FROM gvenzl/oracle-xe:21-slim

ENV ORACLE_PASSWORD=oracle

USER root

COPY db-sample-schemas /opt/oracle/db-sample-schemas

# Only SQL file in setup
COPY setup/install_schemas.sh /container-entrypoint-initdb.d/

USER oracle