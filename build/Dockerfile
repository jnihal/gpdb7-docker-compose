FROM gcr.io/data-gpdb-public-images/gpdb7-rocky8-build

COPY install-dependencies.sh /opt
COPY setup-gpadmin.sh /opt
COPY enable-systemd.sh /opt

RUN /opt/install-dependencies.sh
RUN /opt/setup-gpadmin.sh
RUN /opt/enable-systemd.sh

CMD [ "/usr/sbin/init" ]
