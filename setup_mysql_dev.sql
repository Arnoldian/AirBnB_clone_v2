-- creates db called hbnb_dev_db in current MySQL server
CREATE DATABASE IF NOT EXISTS hbnb_dev_db;
-- creates the MySQL server hbnb_test user
CREATE USER IF NOT EXISTS 'hbnb_dev'@'localhost' IDENTIFIED BY 'hbnb_dev_pwd';
-- Grants Permissions for hbnb_test user
GRANT ALL ON `hbnb_dev_db`.* TO 'hbnb_dev'@'localhost';
GRANT SELECT ON `performance_schema`.* TO 'hbnb_dev'@'localhost';
