To setup required DB structure execute the following commands:

psql -U zabbix zabbix < /usr/share/zabbix-server-pgsql/schema.sql
psql -U zabbix zabbix < /usr/share/zabbix-server-pgsql/images.sql
psql -U zabbix zabbix < /usr/share/zabbix-server-pgsql/data.sql

