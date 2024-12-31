# MKT_CRM_DB

## Libary install

`pip3 install mysql-connector-python`


## Project set up
```SQL
CREATE USER 'popcorn'@'localhost' IDENTIFIED BY 'popcorn';
GRANT ALL PRIVILEGES ON mkt_final.* TO 'popcorn'@'localhost';
FLUSH PRIVILEGES;
```