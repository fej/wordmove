#
# Wordmove Dockerfile
#

# Pull base image.
FROM alpine:3.9.3

MAINTAINER FEj - Emilio Frusciante <emilio.frusciante@gmail.com>

RUN apk --no-cache update && apk --no-cache upgrade
RUN apk add --no-cache \
  bash \
  procps \
  shadow \
  gpgme \
  tar bzip2 gzip \
  openssh openssh-server \
  curl \
  rsync \
  php7 php7-fpm php7-json php7-zlib php7-xml php7-pdo php7-phar php7-openssl \
  php7-pdo_mysql php7-mysqli php7-mysqlnd \
  php7-gd php7-mcrypt \
  php7-curl php7-opcache php7-ctype  \
  php7-intl php7-bcmath php7-dom php7-xmlreader \
  mysql-client \
  sshpass \
  lftp \
  alpine-sdk \
  linux-headers \ 
  openssl-dev \ 
  libssl1.1 \
  libsodium \
  ruby \ 
  ruby-dev \
  zlib-dev 
#RUN apk del alpine-sdk

RUN /bin/bash
RUN gem install --no-ri --no-rdoc bigdecimal json etc io io-console wordmove rbnacl bcrypt_pbkdf rbnacl-libsodium
RUN apk del zlib-dev ruby-dev alpine-sdk linux-headers openssl-dev
RUN rm -rf /var/cache/apk/*
ENV RUBYOPT="-KU -E utf-8:utf-8"
RUN curl -o /usr/local/bin/wp -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x /usr/local/bin/wp

# WP-CLI requires to be executed as non-root, unless --allow-root is given
# As Wordmove currently doesn't call WP-CLI with this flag, the image is executed with a non-root user
RUN useradd -K MAIL_DIR=/dev/null wordmove && echo -e 'wordmove\nwordmove' | passwd wordmove
RUN addgroup -g 82 -S www-data && addgroup -S sudo
RUN adduser wordmove sudo && adduser wordmove www-data
RUN mkdir -p /home/wordmove/.ssh && chown wordmove:wordmove /home/wordmove

USER wordmove
RUN echo "alias sudo='sudo env PATH=\$PATH'" > /home/wordmove/.bashrc \
    && chown wordmove:wordmove /home/wordmove/.bashrc

COPY libsodium.rb /usr/lib/ruby/gems/2.5.0/gems/rbnacl-libsodium-1.0.16/lib/rbnacl/libsodium.rb

WORKDIR /home/wordmove

CMD ["/bin/bash"]

