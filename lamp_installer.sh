#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update -y

# Install Apache
echo "Installing Apache..."
sudo apt install apache2 -y

# Start and enable Apache service
sudo systemctl start apache2
sudo systemctl enable apache2

# Install PHP 8.2 and necessary PHP extensions
echo "Installing PHP 8.2 and extensions..."
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update -y
sudo apt install php8.2 php8.2-mysql php8.2-xml php8.2-mbstring php8.2-curl -y

# Verify PHP installation
php -v

# Configure Apache to use PHP 8.2
echo "Configuring Apache to use PHP 8.2..."
sudo a2enmod php8.2
sudo systemctl restart apache2

# Install MySQL Server
echo "Installing MySQL Server..."
sudo apt install mysql-server -y

# Start MySQL service
sudo systemctl start mysql
sudo systemctl enable mysql

# Install phpMyAdmin
echo "Installing phpMyAdmin..."
sudo apt install phpmyadmin -y

# Link phpMyAdmin to Apache web server
echo "Configuring phpMyAdmin..."
sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

# Install Composer without hash verification
echo "Installing Composer..."
cd ~
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer

# Verify Composer installation
composer -v

# Create /var/www/domains directory
echo "Creating /var/www/domains directory..."
sudo mkdir -p /var/www/domains

# Create a symlink at /domains pointing to /var/www/domains
echo "Creating symlink from /var/www/domains to /domains..."
sudo ln -s /var/www/domains /domains

# Restart Apache to apply changes
echo "Restarting Apache server..."
sudo systemctl restart apache2

echo "Installation completed!"
echo "You can access phpMyAdmin at http://localhost/phpmyadmin"
echo "Composer has been installed. You can use it with the command 'composer'."
echo "The /var/www/domains directory has been created, and a symlink to it is available at /domains."
