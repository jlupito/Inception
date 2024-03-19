#!bin/bash

sleep 10
if [ -f "/var/www/html/wp-config.php" ]
then
	echo "wordpress is already set !"
else
	echo "setting up wordpress"
	sleep 10
	./wp-cli.phar config create --allow-root --dbname=$SQL_DATABASE --dbuser=$SQL_USER --dbpass=$SQL_PASSWORD --dbhost=mariadb:3306 --path='/var/www/html'
	chmod 777 /var/www/html/wp-config.php
	chown -R root:root /var/www/html
	./wp-cli.phar core install --allow-root --url=$DOMAIN_NAME --title="$SITE_TITLE" --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --path='/var/www/html'
	./wp-cli.phar user create $USER1_LOGIN $USER1_MAIL --allow-root --role=author --user_pass=$USER1_PASS --path='/var/www/html'
	echo "wordpress is running !"
fi

exec /usr/sbin/php-fpm7.4 -F;