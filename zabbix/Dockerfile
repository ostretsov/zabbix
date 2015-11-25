FROM phusion/baseimage:0.9.17

RUN apt-get update 

RUN apt-get install -y \
    postgresql \
    apache2 \
    php5 php5-gd php5-pgsql \
    wget \
    ttf-dejavu-core \
    && echo "work_mem = 128MB" >>/etc/postgresql/9.3/main/postgresql.conf && echo "maintenance_work_mem = 256MB" >>/etc/postgresql/9.3/main/postgresql.conf

RUN wget http://repo.zabbix.com/zabbix/2.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_2.4-1+trusty_all.deb && \
    dpkg -i zabbix-release_2.4-1+trusty_all.deb && \
    apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        zabbix-server-pgsql \
        zabbix-frontend-php \
    && sed -ri "s/# php_value date\.timezone Europe\/Riga/php_value date.timezone Europe\/Moscow/" /etc/apache2/conf-available/zabbix.conf \
    && sed -ri "s/local\s+all\s+all\s+peer/local\tall\tall\tmd5/" /etc/postgresql/9.3/main/pg_hba.conf
