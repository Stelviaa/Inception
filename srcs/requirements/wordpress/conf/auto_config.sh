sleep 10 #to wait config mdb

if [ ! -f "wp-config.php"];
then
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    wp core download --allow-root

    wp config create --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/wordpress/' --allow-root

    wp core install --allow-root --url=$DOMAIN_NAME --title=$SQL_TITLE_WEBSITE --admin_user=$SQL_ROOT_USER --admin_password=$SQL_ROOT_PASSWORD --admin_email=$SQL_ROOT_EMAIL

    wp user create --allow-root $USER_NAME $USER_EMAIL --role=author --user_pass=$USER_PASSWORD
fi

/usr/sbin/php-fpm7.3 -F 