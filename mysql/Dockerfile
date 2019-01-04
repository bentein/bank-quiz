FROM mysql:5.7
COPY ./conf/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
COPY ./dump.sql /docker-entrypoint-initdb.d/dump.sql