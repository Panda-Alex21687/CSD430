<?php
/*
Alexander Baldree
June 24, 2026
CSD430 Module 5/6 Database Project
Creates the alex_movies_data table inside the CSD430 database.
*/

$serverName = "localhost";
$userName = "student1";
$password = "pass";
$databaseName = "CSD430";

$connection = new mysqli($serverName, $userName, $password, $databaseName);

if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

$createTableSql = "
CREATE TABLE IF NOT EXISTS alex_movies_data (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    director VARCHAR(100) NOT NULL,
    release_year INT NOT NULL,
    genre VARCHAR(50) NOT NULL,
    rating VARCHAR(10) NOT NULL
)";

if ($connection->query($createTableSql) === TRUE) {
    echo "<h2>Table alex_movies_data was created successfully.</h2>";
} else {
    echo "Error creating table: " . $connection->error;
}

$connection->close();
?>