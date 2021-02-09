FROM alpine:3.11

LABEL maintainer="agiraude <agiraude@student.42.fr>"

COPY srcs /root/

WORKDIR /root/

RUN apk update \
 && apk add nginx \
 && adduser -D -g 'nginx www user' -h /home/www www \
 && mv nginx.conf /etc/nginx/conf.d/demo.conf \
 && ln -sf /dev/stdout /var/log/nginx/access.log \
 && ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["nginx", "-g", "daemon off;"]
