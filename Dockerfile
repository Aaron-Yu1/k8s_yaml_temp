FROM centos:latest
LABEL maintainer="Aaron Yu <aaron.yu1@hotmail.com>"
WORKDIR /tmp
ADD nginx.tar .
RUN useradd -r -s /bin/bash nginx \
    && yum install -y epel-release \
    && yum install -y gcc pcre-devel openssl openssl-devel gd-devel geoip geoip-devel make \
    && cd nginx-1.18.0 \
    && ./configure --prefix=/nginx \
        --with-http_ssl_module \
        --with-http_v2_module \
        --with-http_realip_module \
        --with-http_addition_module \
        --with-http_image_filter_module \
        --with-http_geoip_module \
        --with-http_gzip_static_module \
        --with-http_gunzip_module \
        --with-http_stub_status_module \
        --with-stream \
        --with-stream_ssl_module \
        --with-stream_realip_module \
        --with-stream_geoip_module \
        --with-pcre \
    && make \
    && make install \
    && sed -i '/^http {/a\    include /nginx/conf/conf.d/*.conf;' /nginx/conf/nginx.conf \
    && mkdir /nginx/conf/conf.d \
    && cd .. \
    && cp web.conf /nginx/conf/conf.d/ \
    && mkdir -p /www/html \
    && cp index.html /www/html/
EXPOSE 80
CMD ["/nginx/sbin/nginx", "-g", "daemon off;"]
