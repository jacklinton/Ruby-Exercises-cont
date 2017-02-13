CREATE TABLE users (
id integer PRIMARY KEY AUTOINCREMENT,
fname varchar(50),
lname varchar(50),
email varchar(50),
dateCreated timestamp DEFAULT current_timestamp
);