FROM nginx

RUN   rm -f /etc/nginx/conf.d/*
RUN   echo "Europe/Warsaw" > /etc/timezone && \
      dpkg-reconfigure --frontend noninteractive tzdata

ADD nginx.conf /etc/nginx/nginx.conf
ADD conf.d/* /etc/nginx/conf.d/

RUN mkdir /cache && chmod 777 /cache

VOLUME ["/var/cache/nginx", "/var/log/nginx"]

EXPOSE 80 443

CMD   nginx -g "daemon off;"
