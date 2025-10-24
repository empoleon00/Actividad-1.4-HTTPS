#!/bin/bash

# -e: Finaliza el script cuando hay error
# -x: Muestra el comando por pantalla
set -ex

# Actualiza los repositorios
sudo apt update

# Actualizamos los paquetes 
sudo apt upgrade -y 

# Instalamos el servidor web apache
sudo apt install apache2 -y

# Instalamos php
sudo apt install php libapache2-mod-php php-mysql -y

# Copiamos el archivo de configuración de apache para SSL:
cp ../conf/000-default.conf /etc/apache2/sites-available

# Habilitamos el módulo de rewrite
a2enmod rewrite

# Reiniciamos el servicio de Apache
sudo systemctl restart apache2

# Copiamos nuestro archivo de prueba PHP a /var/www
cp ../php/index.php /var/www/html