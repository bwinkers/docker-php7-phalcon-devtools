FROM bwinkers/docker-php7-phalcon

MAINTAINER Brian Winkers <bwinkers@gmail.com>

RUN git clone "git://github.com/phalcon/phalcon-devtools.git" \
  && cd phalcon-devtools \
  && ./phalcon.sh \
  && . /root/.bashrc



