-- Name: Alexander Baldree
-- Date: June 24, 2026
-- Assignment: CSD430 Module 5/6 Database Project
-- Purpose: Create the CSD430 database, create the movies table, and insert movie records.

CREATE DATABASE IF NOT EXISTS CSD430;

USE CSD430;

CREATE USER IF NOT EXISTS 'student1'@'localhost' IDENTIFIED BY 'pass';

GRANT ALL PRIVILEGES ON CSD430.* TO 'student1'@'localhost';

FLUSH PRIVILEGES;

DROP TABLE IF EXISTS alex_movies_data;

CREATE TABLE alex_movies_data (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    director VARCHAR(100) NOT NULL,
    release_year INT NOT NULL,
    genre VARCHAR(50) NOT NULL,
    rating VARCHAR(10) NOT NULL
);

INSERT INTO alex_movies_data (title, director, release_year, genre, rating)
VALUES
('The Dark Knight', 'Christopher Nolan', 2008, 'Action', 'PG-13'),
('Spider-Man', 'Sam Raimi', 2002, 'Action', 'PG-13'),
('Forrest Gump', 'Robert Zemeckis', 1994, 'Drama', 'PG-13'),
('The Matrix', 'Lana Wachowski and Lilly Wachowski', 1999, 'Sci-Fi', 'R'),
('Jurassic Park', 'Steven Spielberg', 1993, 'Adventure', 'PG-13'),
('Toy Story', 'John Lasseter', 1995, 'Animation', 'G'),
('Remember the Titans', 'Boaz Yakin', 2000, 'Sports Drama', 'PG'),
('The Lion King', 'Roger Allers and Rob Minkoff', 1994, 'Animation', 'G'),
('Avatar', 'James Cameron', 2009, 'Sci-Fi', 'PG-13'),
('Top Gun: Maverick', 'Joseph Kosinski', 2022, 'Action', 'PG-13');

SELECT * FROM alex_movies_data;