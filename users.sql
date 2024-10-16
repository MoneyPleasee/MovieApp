CREATE DATABASE movie_app_db;

USE movie_app_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255)
);

CREATE TABLE movies (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(255) NOT NULL,
    description TEXT,
    image_url VARCHAR(255)
);


