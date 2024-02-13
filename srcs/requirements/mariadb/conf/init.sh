#!/bin/bash

# Démarrer le service MySQL/MariaDB
service mysql start

# Créer la base de données si elle n'existe pas
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Créer l'utilisateur s'il n'existe pas
mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# Donner les privilèges à l'utilisateur sur la base de données
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Changer le mot de passe de l'utilisateur root
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Actualiser les privilèges
mysql -e "FLUSH PRIVILEGES;"

# Arrêter le serveur MySQL/MariaDB
mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown

# Exécuter le serveur MySQL/MariaDB en mode sûr
exec mysqld_safe
