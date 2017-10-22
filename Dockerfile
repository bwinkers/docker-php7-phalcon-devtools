FROM bwinkers/docker-php7-phalcon

MAINTAINER Brian Winkers <bwinkers@gmail.com>

RUN apt-get update \
    && docker-php-source extract \    
    && curl -fsSL 'https://xdebug.org/files/xdebug-2.5.5.tgz' -o xdebug.tar.gz \
    && mkdir -p xdebug \
    && tar -xf xdebug.tar.gz -C xdebug --strip-components=1 \
    && rm xdebug.tar.gz \
    && ( \
    cd xdebug \
    && phpize \
    && ./configure --enable-xdebug \
    && make -j$(nproc) \
    && make install \
    ) \
    && rm -r xdebug \
    && docker-php-ext-enable xdebug \
    && git clone "git://github.com/phalcon/phalcon-devtools.git" \
    && cd phalcon-devtools \
    && ./phalcon.sh \
    && . /root/.bashrc \
    && rm -Rf cphalcon \
    && docker-php-source delete 