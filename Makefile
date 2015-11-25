.PHONY: prepare
prepare:
	-cp docker-compose.yml.dist docker-compose.yml
	-mkdir data
	-cp -n zabbix/boot/00init.sh.dist zabbix/boot/00init.sh
	-chmod +x zabbix/boot/00init.sh

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
