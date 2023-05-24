FROM gcr.io/data-gpdb-public-images/gpdb7-rocky8-build

COPY install-dependencies.sh /opt
COPY setup-gpadmin.sh /opt

RUN /opt/install-dependencies.sh
RUN /opt/setup-gpadmin.sh
