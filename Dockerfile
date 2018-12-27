FROM nginx:latest

ARG HOST_PORT
ARG BACKEND_HOST_NAME
ARG BACKEND_HOST_PORT

COPY default.conf /etc/nginx/conf.d/default.conf.template

# RUN set -ex \
#     && mkdir /etc/nginx/html \
#     && echo 'Hello' > /etc/nginx/html/index.html

CMD ["/bin/sh", "-c", "envsubst '$$HOST_PORT$$BACKEND_HOST_NAME$$BACKEND_HOST_PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"]
