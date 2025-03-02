FROM alpine:latest

RUN apk add --no-cache nginx \
    && mkdir -p /var/www/html \
    && chown -R nginx:nginx /var/www/html

RUN addgroup -S nginx || true \
    && adduser -S nginx -G nginx || true

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
