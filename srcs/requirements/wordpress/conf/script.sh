#!/bin/bash 

echo "running script..."
sleep 10

if [ -f /var/www/html/wp-config.php ]; then
	echo "wordpress is already configured."
	echo "done."
	/usr/sbin/php-fpm7.4 -F
fi

wp config create --allow-root --dbname=${wp_database} --dbuser=${wp_user} --dbpass=${wp_user_password} --dbhost=mariadb
wp core install --allow-root --url=${wp_hostname} --title="Inception" --admin_user=${wp_admin_user} --admin_password=${wp_admin_password} --admin_email=adm@chabrune.42.fr
wp user create --allow-root ${wp_user} ${wp_user}@${wp_hostname} --role=author --user_pass=${wp_user_password}
wp plugin update --allow-root --all

echo "done."

/usr/sbin/php-fpm7.4 -F