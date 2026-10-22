-- Same credentials as the former mariadb service container (MARIADB_ROOT_PASSWORD=test, MARIADB_DATABASE=test).
ALTER USER root@localhost IDENTIFIED BY 'test';
CREATE USER root@'%' IDENTIFIED BY 'test';
GRANT ALL PRIVILEGES ON *.* TO root@'%' WITH GRANT OPTION;
CREATE DATABASE test;
FLUSH PRIVILEGES;