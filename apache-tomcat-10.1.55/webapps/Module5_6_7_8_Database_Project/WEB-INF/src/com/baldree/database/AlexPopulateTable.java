package com.baldree.database;

/*
 * Alexander Baldree
 * July 8, 2026
 * Module 7 Project Part 2
 * Populates the movies database table with sample records.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class AlexPopulateTable {

    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/CSD430?useSSL=false";
        String user = "student1";
        String password = "pass";

        String[] insertStatements = {
                "INSERT INTO alexmoviesdata (title, director, release_year, genre, rating) VALUES ('The Dark Knight', 'Christopher Nolan', 2008, 'Action', 'PG-13')",
                "INSERT INTO alexmoviesdata (title, director, release_year, genre, rating) VALUES ('Forrest Gump', 'Robert Zemeckis', 1994, 'Drama', 'PG-13')",
                "INSERT INTO alexmoviesdata (title, director, release_year, genre, rating) VALUES ('Jurassic Park', 'Steven Spielberg', 1993, 'Adventure', 'PG-13')",
                "INSERT INTO alexmoviesdata (title, director, release_year, genre, rating) VALUES ('Toy Story', 'John Lasseter', 1995, 'Animation', 'G')",
                "INSERT INTO alexmoviesdata (title, director, release_year, genre, rating) VALUES ('The Avengers', 'Joss Whedon', 2012, 'Action', 'PG-13')",
                "INSERT INTO alexmoviesdata (title, director, release_year, genre, rating) VALUES ('Back to the Future', 'Robert Zemeckis', 1985, 'Sci-Fi', 'PG')",
                "INSERT INTO alexmoviesdata (title, director, release_year, genre, rating) VALUES ('The Lion King', 'Roger Allers', 1994, 'Animation', 'G')",
                "INSERT INTO alexmoviesdata (title, director, release_year, genre, rating) VALUES ('Spider-Man', 'Sam Raimi', 2002, 'Action', 'PG-13')",
                "INSERT INTO alexmoviesdata (title, director, release_year, genre, rating) VALUES ('Remember the Titans', 'Boaz Yakin', 2000, 'Sports', 'PG')",
                "INSERT INTO alexmoviesdata (title, director, release_year, genre, rating) VALUES ('Guardians of the Galaxy', 'James Gunn', 2014, 'Action', 'PG-13')"
        };

        try {
            Class.forName("com.mysql.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(url, user, password);
                    Statement statement = connection.createStatement()) {

                for (String insertSql : insertStatements) {
                    statement.executeUpdate(insertSql);
                }

                System.out.println("alexmoviesdata table populated successfully.");
            }

        } catch (ClassNotFoundException | SQLException error) {
            System.out.println("Error populating the table.");
        }
    }
}
