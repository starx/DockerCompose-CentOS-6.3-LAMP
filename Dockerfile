FROM starx/centos63:lamp_ext

# Initialize MySQL Database
ARG MYSQL_ROOT_PASSWORD
ENV MYSQL_ROOT_PASSWORD="$MYSQL_ROOT_PASSWORD"

ADD mysql/data /tmp/data
ADD scripts/initdb.sh /tmp/initdb.sh
RUN chmod +x /tmp/initdb.sh
RUN ./tmp/initdb.sh

# Expose Services
# ---

EXPOSE 80 3306 9000 5672

CMD service mysqld start && /usr/sbin/apachectl -D FOREGROUND