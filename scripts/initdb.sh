#!/bin/bash
service mysqld start
/usr/bin/mysqladmin -u root password "${MYSQL_ROOT_PASSWORD}"
for f in /tmp/data/*; do
	echo "Running $f";
	case "$f" in
		*.sh)     . "$f" ;;
		*.sql)    mysql -u root -p$MYSQL_ROOT_PASSWORD < "$f"; echo ;;
		*.sql.gz) gunzip -c "$f" | mysql -u root -p$MYSQL_ROOT_PASSWORD; echo ;;
		*)        echo "ignoring $f" ;;
	esac
	echo
done