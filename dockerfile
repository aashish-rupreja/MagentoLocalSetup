# Use the PHP-FPM image as the base
FROM php:8.2.19-fpm

# Install system dependencies and extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libsodium-dev \
    libzip-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libxml2-dev \
    libxslt1-dev \
    git \
    unzip \
    zip \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd bcmath xsl soap intl mbstring pdo_mysql zip sockets sodium

# Download and install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set working directory
WORKDIR /var/www/html
