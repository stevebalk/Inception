FROM alpine:3.20

# Update the package repository and install MariaDB
RUN apk update && apk add --no-cache mariadb mariadb-client

# Copy the configuration script for MariaDB
COPY tools/configuration.sh /

# Run the configuration script for MariaDB
CMD ["/configuration.sh"]