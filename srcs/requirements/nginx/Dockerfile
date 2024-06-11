# Use the latest version of Alpine Linux as the base image
FROM alpine:3.19

# Update the package repository and install Nginx and OpenSSL
RUN apk update && apk add --no-cache \
    nginx \
    openssl

# Create a directory for SSL certificates and generate self-signed certificates (for testing purposes)
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/nginx.key \
        -out /etc/nginx/ssl/nginx.crt \
        -subj "/CN=localhost"

# Remove default Nginx server definition if it exists
RUN rm -f /etc/nginx/conf.d/default.conf /etc/nginx/http.d/default.conf

# Copy the updated Nginx configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Copy HTML files to be served by Nginx
# COPY html /usr/share/nginx/html

# Expose port 443 for HTTPS traffic
EXPOSE 443

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]