.PHONY: prepare
prepare:
	-cp -n docker-compose.yml.dist docker-compose.yml
	-mkdir data
	-cp -n zabbix/etc/zabbix.conf.php.dist zabbix/etc/zabbix.conf.php
	-cp -n zabbix/etc/zabbix_server.conf.dist zabbix/etc/zabbix_server.conf
	-cp -n zabbix/boot/00init.sh.dist zabbix/boot/00init.sh
	-chmod +x zabbix/boot/00init.sh
	-git clone --depth=1 https://github.com/ericoc/zabbix-slack-alertscript.git
	-chmod +x ./zabbix-slack-alertscript/slack.sh
	-echo "At first, configure zabbix-slack-alertscript/slack.sh script!"

.PHONY: stat
stat:
	docker-compose ps

.PHONY: start
start:
	docker-compose rm -f
	docker-compose build
	docker-compose up -d
	make stat

.PHONY: stop
stop:
	docker-compose stop

.PHONY: restart
restart:
	make stop
	make start

.PHONY: rshell
rshell:
	ZABBIX=`docker-compose ps -q zabbix`; \
   		docker exec -ti $$ZABBIX /bin/bash
