# Dockerized Zabbix 2.4 with PostgreSQL 9.3

### Installation

Just flick through Makefile to understand what is happening.

Default configuration options will work out of box. Quick installation and setup might look like this:

```sh
$ git clone https://github.com/ruFog/zabbix.git
$ cd zabbix
$ make prepare
$ vi docker-compose.yml # be especially careful with ports section
$ vi zabbix/boot/00init.sh # change db password you like
$ vi zabbix/etc/zabbix.conf.php # configure Zabbix web-client
$ vi zabbix/etc/zabbix_server.conf # all importaint things are here
```

Then start up Zabbix:

```sh
$ make start
```
The previous command will build an image at the first launch.

To setup required DB structure execute the following commands:

```sh
$ make rshell
# psql -U zabbix zabbix < /usr/share/zabbix-server-pgsql/schema.sql
# psql -U zabbix zabbix < /usr/share/zabbix-server-pgsql/images.sql
# psql -U zabbix zabbix < /usr/share/zabbix-server-pgsql/data.sql
```

That's all. Configure zabbix agents and enjoy!
