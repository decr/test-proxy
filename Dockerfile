FROM nginx:latest

COPY default.conf /etc/nginx/conf.d/default.conf.template

CMD ["/bin/sh", "-c", "envsubst '$$NGINX_PORT$$NGINX_BACKEND_HOST_NAME$$NGINX_BACKEND_HOST_PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
EXPOSE $NGINX_PORT
