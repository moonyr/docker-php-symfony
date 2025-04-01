FROM php:8.1-fpm

# Installer les extensions nécessaires pour Symfony
RUN apt-get update && apt-get install -y \
    libicu-dev \
    libpq-dev \
    unzip \
    && docker-php-ext-install intl pdo pdo_mysql opcache

# Installer Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Installer Node.js et Yarn
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g yarn

WORKDIR /var/www/html
