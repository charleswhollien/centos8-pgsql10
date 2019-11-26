FROM centos:8
ENV PGDATA="/var/lib/pgsql/data"
ENV TZONE=America/New_York
RUN ln -sf /usr/share/zoneinfo/$TZONE /etc/localtime
RUN dnf install -y cronie postgresql-server glibc-langpack-en
COPY pg_hba.conf /config/
COPY postgresql.conf /config/
COPY docker-entrypoint.sh / 
COPY midnight.sh /jobs/midnight.sh
COPY root /var/spool/cron/root
RUN chmod a+x /docker-entrypoint.sh && chmod a+x /jobs/midnight.sh
VOLUME /var/lib/pgsql/data
CMD /docker-entrypoint.sh
