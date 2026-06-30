<?php
/*
Name: Alexander Baldree
Date: June 24, 2026
Assignment: CSD430 Module 5/6 Database Project
Purpose: Drops the alex_movies_data table from the CSD430 database.
*/

$serverName = "localhost";
$userName = "student1";
$password = "pass";
$databaseName = "CSD430";

$connection = new mysqli($serverName, $userName, $password, $databaseName);

if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

$dropTableSql = "DROP TABLE IF EXISTS alex_movies_data";

if ($connection->query($dropTableSql) === TRUE) {
    echo "<h2>Table alex_movies_data was dropped successfully.</h2>";
} else {
    echo "Error dropping table: " . $connection->error;
}

$connection->close();
?>