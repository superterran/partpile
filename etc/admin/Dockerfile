FROM php:7.2-fpm

RUN apt-get update && apt-get install -y \
  bzip2 \
  curl \
  git \
  zip \
  openssh-client \
  libcurl4-openssl-dev \
  libfreetype6-dev \
  libicu-dev \
  libjpeg-dev \
  libmcrypt-dev \
  libpng-dev \
  libxml2-dev \
  libxslt1-dev \
  gnupg2\
  && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install -j$(nproc) pdo pdo_mysql gd xsl bcmath intl soap zip

RUN echo 'memory_limit = 512M' >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini

# # Ioncube Loader
# RUN cd /tmp \
# 	  && curl -o ioncube.tar.gz http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz \
#     && tar -xvvzf ioncube.tar.gz \
#     && mv ioncube/ioncube_loader_lin_7.2.so /usr/local/lib/php/extensions \
#     && rm -Rf ioncube.tar.gz ioncube \
#     && echo "zend_extension=/usr/local/lib/php/extensions/ioncube_loader_lin_7.2.so" > /usr/local/etc/php/conf.d/00_docker-php-ext-ioncube.ini

# # SourceGuardian
# RUN cd /tmp \
#     && curl -o sourceguardian.tar.gz http://www.sourceguardian.com/loaders/download/loaders.linux-x86_64.tar.gz \
#     && mkdir sourceguardian \
#     && tar -xvvzf sourceguardian.tar.gz --directory ./sourceguardian \
#     && ls \
#     && mv sourceguardian/ixed.7.2.lin /usr/local/lib/php/extensions \
#     && echo "zend_extension=/usr/local/lib/php/extensions/ixed.7.2.lin" > /usr/local/etc/php/conf.d/00_docker-php-ext-sourceguardian.ini \
#     && rm -rf sourceguardian/

# Composer
RUN curl --silent --show-error https://getcomposer.org/installer | php
RUN mv /var/www/html/composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

# Lets run Magento Installation

COPY ./app /app

# RUN cd /app && composer install