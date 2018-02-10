FROM okg-reserve_base
# Config
RUN mkdir -p /usr/share/nginx/html/
RUN mkdir -p /var/log/php/
# PHP config
COPY php/php-fpm.conf /etc/php/5.6/fpm/php-fpm.conf
COPY php/php.ini /etc/php/5.6/fpm/php.ini
# Nginx config
COPY nginx/nginx.conf /usr/local/nginx/nginx.conf
COPY nginx/conf.d /usr/local/nginx/conf.d
# Log/cache dir
RUN mkdir -p /var/log/nginx/
RUN chmod -R 777 /var/log/nginx/
RUN chown nginx:nginx /var/log/nginx/
RUN mkdir -p /var/logs/bondy/
RUN chmod -R 777 /var/logs/bondy/
RUN chown nginx:nginx /var/logs/bondy/
RUN mkdir -p /var/cache/bondy && chmod -R 777 /var/cache/bondy && chown nginx:nginx /var/cache/bondy
# Start nginx & php
ENTRYPOINT php-fpm5.6 -y /etc/php/5.6/fpm/php-fpm.conf && php-fpm5.6 start || true && service nginx start && tail -f /dev/null