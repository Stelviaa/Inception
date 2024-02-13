sleep 10 #to wait config mdb
wp config create	--allow-root \
    --dbname=$SQL_DATABASE \
    --dbuser=$SQL_USER \
    --dbpass=$SQL_PASSWORD \
    --dbhost=mariadb:3306 --path='/var/www/wordpress'

wp core install --url=$DOMAIN_NAME
\ --title=$SQL_TITLE_WEBSITE
\ --admin_user=$SQL_ROOT_USER
\ --admin_password=$SQL_ROOT_PASSWORD
\ --admin_email=$SQL_ROOT_EMAIL

wp user create $USER_NAME $USER_EMAIL --role=contributor --user_pass=$USER_PASSWORD


/usr/sbin/php-fpm7.3 -F 