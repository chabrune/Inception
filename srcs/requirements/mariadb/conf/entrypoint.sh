# #!/bin/bash

set -e
echo "Loading mariadb initialization script..."
/etc/init.d/mariadb start
if [ -f ./db_configured ]; then #if db is already configured
	echo "mariadb is already configured."
else	
	until mysqladmin ping &> /dev/null; do #return is alive if mysql is up
	        sleep 0.5
	done
	echo "Setting root password"
	mysql -uroot -e "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('${root_password}');"
	sleep 0.5	
	mysql -uroot -e "FLUSH PRIVILEGES;"
	sleep 0.5
	echo "Searching/Creating database '${db_name}'"
	mysql -uroot -p"${root_password}" -e "CREATE DATABASE IF NOT EXISTS \`${db_name}\`;"
	sleep 0.5
	echo "Searching/Creating user '${db_user}'"
	mysql -uroot -p"${root_password}" -e "CREATE USER IF NOT EXISTS \`${db_user}\`@'localhost';"
	sleep 0.5
	mysql -uroot -p"${root_password}" -e "SET PASSWORD FOR '${db_user}'@'localhost' = PASSWORD('${db_user_password}');"
	sleep 0.5
	echo "Setting '${db_user}' privileges"
	mysql -uroot -p"${root_password}" -e "GRANT ALL PRIVILEGES ON *.* TO '${db_user}'@'wordpress.srcs_inception' IDENTIFIED BY '${db_user_password}';"
	sleep 0.5	
	mysql -uroot -p"${root_password}" -e "FLUSH PRIVILEGES;"
	sleep 0.5
	touch db_configured
fi

mysqladmin -uroot -p"{root_password}" shutdown

exec "$@"
# exec "$@" = replace the current process by the command passed as argument 
# --> exec mysqld --bind-address=0.0.0.0