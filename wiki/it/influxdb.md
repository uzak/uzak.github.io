# InfluxDB

    influx -host $HOST -precision rfc3339   # timestamps in human readable form
    
    show field keys from printer_telemetry



    docker run -p8086:8086 -v influxtest:/var/lib/influxdb influxdb

## Protocol

    weather,location=us-midwest temperature=82 1465839830100400200
    |    -------------------- --------------  |
    |             |             |             |
    |             |             |             |
    +-----------+--------+-+---------+-+---------+
    |measurement|,[tag_set|](tag_set|) |field_set| |timestamp|
    +-----------+--------+-+---------+-+---------+
    

    <field_key>=<field_value>,<field_key>=<field_value>
    <tag_key>=<tag_value>,<tag_key>=<tag_value>
    
The timestamp for your data point in nanosecond-precision Unix time. The timestamp is optional in line protocol. If you do not specify a timestamp for your data point InfluxDB uses the server’s local nanosecond timestamp in UTC.  

For tag keys, tag values, and field keys always use a backslash character \ to escape: `=`, ` `, `,`

## DataTypes

* float: 82 
* integer: 82i 
* string "too warm"
* boolean: t, T, true, True, TRUE, f, F, false, False, FALSE

## Examples:

    show databases
    create database test
    use test


    INSERT weather,location=us-midwest temperature=82 1465839830100400200
    
    SELECT * FROM "weather"
    
    > insert weather,location=us-midwest temperature=22 
    > insert weather,location=us-midwest temperature=21,humidity=1
    > select * from weather;
    delete from weather where time=1587024650460040896;
    drop database test
    
    format json
    format csv
    format column
    
    
    show tag keys where key = '...'
    
    show measurements
    drop measurement <name>

Note tags are always strings and strings are quoted with apostrophes (')!
    
## Live Examples
    select * from "printer_MINI_telemetry" where printer_id = '69' limit 10;
    select "temp_bed","printer_id" from "printer_MINI_telemetry" where printer_id = '69' limit 10;
    
    show series
    show measurements

## Auth
[source](https://gist.github.com/Paraphraser/9f3aa21fddd5d4e8141a7ab03ffb4dd7)

    CREATE DATABASE "mydatabase1"

    CREATE USER "admin" WITH PASSWORD 'admin' WITH ALL PRIVILEGES;
    # NOTE if there is not at least one user WITH ALL PRIVILEGES
    #  it seems that influx won't authenticate any other user. Thus
    #  at least one admin is required.
    GRANT ALL ON "connect_uzak" TO "admin"

extend docker-compose influx env:

    INFLUXDB_HTTP_AUTH_ENABLED=true
    
restart:

    cd /srv
    docker-compose up -d influxdb
    
experiment:

    > show databases;
    ...
    > auth
    username: non-existing
    password:
    > use connect_uzak;
    WARN: authorization failed
    Using database connect_uzak
    > show measurements;
    ERR: authorization failed
    > auth
    username: admin
    password: 
    > show users;
    user  admin
    ----  -----
    admin true
    > show grants for "connect";
    
    
## Links

* https://docs.influxdata.com/influxdb/v1.8/concepts/key_concepts/#series
* https://docs.influxdata.com/influxdb/v1.8/query_language/explore-data/
