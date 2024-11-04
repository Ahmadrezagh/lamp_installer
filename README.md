
# LAMP Installer Script

A simple shell script to install a LAMP stack (Linux, Apache, MySQL, PHP) along with phpMyAdmin and Composer on an Ubuntu server. This script also sets up a `domains` directory at `/var/www/domains` and creates a symlink to it at `/domains`.

## Prerequisites

- An Ubuntu-based system (Debian-based distributions should work as well).
- Sudo privileges to execute the installation commands.

## Installation

1. Clone or download this repository to your Ubuntu server.
2. Make sure the script is executable:
   ```bash
   chmod +x lamp_installer.sh
   ```
3. Run the script:
   ```bash
   ./lamp_installer.sh
   ```

## What This Script Does

1. **Updates the system’s package list** to ensure all packages are up to date.
2. **Installs Apache** and enables it to start at boot.
3. **Installs PHP 8.2** and common extensions (e.g., MySQL, XML, mbstring, curl).
4. **Configures Apache to work with PHP 8.2**.
5. **Installs MySQL Server** and starts the service.
6. **Installs phpMyAdmin** and links it to be accessible at `http://localhost/phpmyadmin`.
7. **Installs Composer** globally for dependency management.
8. **Creates a `/var/www/domains` directory** and **sets up a symlink at `/domains`** for easier access.

## Accessing Your Services

- **Apache**: Should be accessible on port 80.
- **phpMyAdmin**: Access it at `http://localhost/phpmyadmin`.
- **Composer**: Available globally with the `composer` command.
- **Domains Directory**: Access via `/var/www/domains` or the symlink at `/domains`.

## Setting MySQL Root Password (Optional)

To set a password for the MySQL root user, you can use the following commands:

1. Open the MySQL shell:
   ```bash
   sudo mysql
   ```
2. Set the root password (replace `password` with your desired password):
   ```sql
   ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
   ```
3. Exit the MySQL shell:
   ```bash
   exit
   ```

## Script Breakdown

| Step                         | Description                                                                                       |
|------------------------------|---------------------------------------------------------------------------------------------------|
| **System Update**            | Updates the package list to ensure the latest versions of each package are installed.            |
| **Apache Installation**      | Installs and starts Apache. Ensures it's enabled to start at boot.                               |
| **PHP 8.2 Installation**     | Installs PHP 8.2 along with necessary extensions for MySQL, XML, mbstring, and curl support.     |
| **MySQL Installation**       | Installs MySQL and enables it to start at boot.                                                  |
| **phpMyAdmin Installation**  | Installs phpMyAdmin and links it to the Apache server.                                           |
| **Composer Installation**    | Installs Composer globally for PHP dependency management.                                        |
| **Domains Directory Setup**  | Creates `/var/www/domains` and sets up a symlink at `/domains`.                                  |

## Notes

- This script is designed for a fresh installation on an Ubuntu server. It may override existing configurations.
- Please ensure any existing services or configurations are backed up before running this script.
