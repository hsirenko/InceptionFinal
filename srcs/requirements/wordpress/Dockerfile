FROM alpine:3.21

ARG PHP_VERSION=82 \
    DB_NAME \
    DB_USER \
    DB_PASS
RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    php${PHP_VERSION}-json \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-dom \
    php${PHP_VERSION}-exif \
    php${PHP_VERSION}-fileinfo \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-openssl \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-redis \
    wget \
    unzip

RUN sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \   
        /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
        /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
        /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*

WORKDIR /var/www
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip
COPY ./requirements/wordpress/conf/wp-config-create.sh .
RUN sh wp-config-create.sh && rm wp-config-create.sh && \
    chmod -R 0777 wp-content/
    # chmod +x requirements/wordpress/tools/make_dir.sh \
    # requirements/wordpress/tools/make_dir.sh
CMD ["/usr/sbin/php-fpm82", "-F"]
#CMD ["/bin/sh"]

# docker exec -it wordpress /usr/sbin/php-fpm82 -v
# docker exec -it wordpress /usr/sbin/php-fpm82 -m



#access wordpress container and check for /etc/php82 dir and www.conf file

#docker exec -it wordpress /bin/sh
# ls /etc/php82/    ->  /etc/php82/php-fpm.d
#ls /etc/php82/php-fpm.d/
#www.conf