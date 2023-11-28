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
