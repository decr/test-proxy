FROM nginx:latest

COPY default.conf /etc/nginx/conf.d/default.conf.template

CMD ["/bin/sh", "-c", "envsubst '$$HOST_PORT$$BACKEND_HOST_NAME$$BACKEND_HOST_PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
