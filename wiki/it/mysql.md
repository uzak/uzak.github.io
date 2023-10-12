    mysql -u connect -P 3306 --protocol tcp -h localhost connect -p

    show index from print_file;
    
    rename table event to event_bak_20210311;
    create table event like event_bak_20210311;
    
    
    CREATE USER 'connect' IDENTIFIED BY 'XXX'; #XXX
    CREATE SCHEMA connect;
    GRANT ALL PRIVILEGES ON connect.* TO 'connect'@'%';
    
    SELECT user, host from mysql.user;

## Install

    docker run percona/percona-xtradb-cluster:5.7

Export table to SQL:

    SELECT * FROM event
    INTO OUTFILE '/var/lib/mysql-files/events.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';
    
Show size of tables/indexes:

    show table status from [dbname]
    
Optimize table:
    optimize table event;

Migrate table to MyISAM

ALTER TABLE events ENGINE=MYISAM;


SHOW CREATE TABLE event;
select * into outfile '/var/lib/mysql-files/event.txt' from event;
LOAD DATA INFILE '/var/lib/mysql-files/event.txt' INTO TABLE event2;


# Optimization

SHOW TABLE STATUS WHERE Name = 'event'\G

## Slow Query Log

https://www.techawaken.com/enable-mysql-slow-query-log/
    
	mkdir /var/log/mysql
	touch /var/log/mysql/slow_query.log
	chown mysql.mysql -R /var/log/mysql
    
    SET GLOBAL slow_query_log_file = '/var/log/mysql/slow_query.log';
    SET GLOBAL long_query_time = 1;  -- 1 second
    SET GLOBAL log_queries_not_using_indexes = 1;
    SET GLOBAL log_slow_admin_statements = 1;
    SET GLOBAL slow_query_log = 'ON';
    
    
    SHOW VARIABLES LIKE 'slow_query_log';
	

# Misc Errors
## 1290 
https://stackoverflow.com/questions/31951468/error-code-1290-the-mysql-server-is-running-with-the-secure-file-priv-option

	mysql> SHOW VARIABLES LIKE "secure_file_priv";

# Replication

Percona XtraDB Cluster currently supports replication only for tables that use a transactional storage engine (XtraDB or InnoDB). To ensure data consistency, the following statements should not be allowed for tables that use a non-transactional storage engine (MyISAM, MEMORY, CSV, etc.):

    Data manipulation statements that perform writing to table (for example, INSERT, UPDATE, DELETE, etc.)
    The following administrative statements: CHECK, OPTIMIZE, REPAIR, and ANALYZE
    TRUNCATE TABLE and ALTER TABLE

    
mac address - varchar(17)

mysql slow log:
    https://www.techawaken.com/enable-mysql-slow-query-log/

dump percona cluster: 

    mysqldump -h HOST -u USER -p SCHEMA --skip_add_locks --skip-lock-tables  --column-statistics=0 > connect.dump
    
mysql delete all schemas (dbs) matching a name:

    SELECT CONCAT( 'drop schema if exists ', schema_name , ';' ) 
        AS statement FROM information_schema.schemata 
        WHERE schema_name LIKE 'connect_%_%';
        
mysql reset AUTO_INCREMENT

    ALTER TABLE tablename AUTO_INCREMENT = 1
    
mysql show what's happening (locks etc):

    SHOW FULL PROCESSLIST;
    
mysql set charset
    ALTER TABLE mytable CONVERT TO CHARACTER SET utf8;
    
mysql show queries:

    set global general_log = 'on';      -- global
    set sql_log_off = 'off';            --local
    show variables like 'general_log%';
    

mysql show processes:

    mysqladmin -h HOST -u USER -pPASSWORD -i 1 -v  processlist
    
mysql rename column:

    alter table printer change `apendix` `appendix` bool;
    
mysql dump db:

    SHOW CREATE TABLE event;
    select * into outfile '/var/lib/mysql-files/event.txt' from event;
    LOAD DATA INFILE '/var/lib/mysql-files/event.txt' INTO TABLE event2;
