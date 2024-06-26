-- creates db called hbnb_test_db in current MySQL server
CREATE DATABASE IF NOT EXISTS hbnb_test_db;
-- creates MySQL server hbnb_test user
CREATE USER IF NOT EXISTS 'hbnb_test'@'localhost' IDENTIFIED BY 'hbnb_test_pwd';
-- grants permissions for hbnb_test user
GRANT ALL ON `hbnb_test_db`.* TO 'hbnb_test'@'localhost';
GRANT SELECT ON `performance_schema`.* TO 'hbnb_test'@'localhost';
