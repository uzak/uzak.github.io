brew install postgres 

    To migrate existing data from a previous major version of PostgreSQL run:
    brew postgresql-upgrade-database

    This formula has created a default database cluster with:
    initdb --locale=C -E UTF-8 /opt/homebrew/var/postgres
    For more details, read:
    https://www.postgresql.org/docs/14/app-initdb.html

    To restart postgresql after an upgrade:
    brew services restart postgresql
    Or, if you don't want/need a background service you can just run:
    /opt/homebrew/opt/postgresql/bin/postgres -D /opt/homebrew/var/postgres
    
    
## Get logfile 
show data_directory;
SELECT  pg_current_logfile();


## Create Grafana User
CREATE USER grafana WITH LOGIN NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION;
ALTER ROLE grafana WITH PASSWORD 'XXX';
GRANT grafana TO postgres;
CREATE DATABASE grafana WITH OWNER = grafana ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8' CONNECTION LIMIT = -1;
