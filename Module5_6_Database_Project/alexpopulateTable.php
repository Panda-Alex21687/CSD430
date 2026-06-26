<?php
/*
Name: Alex Baldree
Date: June 24, 2026
Assignment: CSD430 Module 5/6 Database Project
Purpose: Populates the alex_movies_data table with 10 movie records.
*/

$serverName = "localhost";
$userName = "student1";
$password = "pass";
$databaseName = "CSD430";

$connection = new mysqli($serverName, $userName, $password, $databaseName);

if ($connection->connect_error) {
    die("Connection failed: " . $connection->connect_error);
}

$clearTableSql = "TRUNCATE TABLE alex_movies_data";

$connection->query($clearTableSql);

$insertRecordsSql = "
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
('Top Gun: Maverick', 'Joseph Kosinski', 2022, 'Action', 'PG-13')
";

if ($connection->query($insertRecordsSql) === TRUE) {
    echo "<h2>Records were inserted successfully.</h2>";
} else {
    echo "Error inserting records: " . $connection->error;
}

$result = $connection->query("SELECT * FROM alex_movies_data");

echo "<h2>Movie Records</h2>";
echo "<table border='1' cellpadding='8'>";
echo "<tr>
        <th>Movie ID</th>
        <th>Title</th>
        <th>Director</th>
        <th>Release Year</th>
        <th>Genre</th>
        <th>Rating</th>
      </tr>";

while ($row = $result->fetch_assoc()) {
    echo "<tr>";
    echo "<td>" . $row["movie_id"] . "</td>";
    echo "<td>" . $row["title"] . "</td>";
    echo "<td>" . $row["director"] . "</td>";
    echo "<td>" . $row["release_year"] . "</td>";
    echo "<td>" . $row["genre"] . "</td>";
    echo "<td>" . $row["rating"] . "</td>";
    echo "</tr>";
}

echo "</table>";

$connection->close();
?>