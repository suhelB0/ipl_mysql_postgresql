CREATE DATABASE ipl_data;

CREATE USER 'suhel'@'localhost' IDENTIFIED BY 'suhel123@';

GRANT ALL PRIVILEGES ON ipl_data.* TO 'suhel'@'localhost';

FLUSH PRIVILEGES;
