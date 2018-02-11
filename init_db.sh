#! /bin/sh
/etc/init.d/mysql start
DB = "bondy"
USER=root
PASS=123456
mysql -u ${USER} -p${PASS} ${DB} < bondy.sql
exit 0