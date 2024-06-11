FROM alpine:3.19

# Update the package repository and install MariaDB
RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir -p /var/lib/mysql /run/mysqld 
RUN chown -R mysql:mysql /var/lib/mysql /run/mysqld

# Expose the MariaDB port
EXPOSE 3306

# Copy the configuration script for MariaDB
COPY tools/configuration.sh /

COPY tools/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# Run the configuration script for MariaDB
ENTRYPOINT ["sh", "/configuration.sh"]