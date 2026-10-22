-- Same credentials as the former mariadb service container (MARIADB_ROOT_PASSWORD=test, MARIADB_DATABASE=test).
ALTER USER root@localhost IDENTIFIED BY 'test';
-- mariadb-install-db (normal auth) also creates passwordless root@127.0.0.1 and root@::1, which are matched
-- before root@'%' and break TCP logins with the password.
DROP USER IF EXISTS root@'127.0.0.1', root@'::1';
CREATE USER IF NOT EXISTS root@'%' IDENTIFIED BY 'test';
GRANT ALL PRIVILEGES ON *.* TO root@'%' WITH GRANT OPTION;
CREATE DATABASE IF NOT EXISTS test;
FLUSH PRIVILEGES;