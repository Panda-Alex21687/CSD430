package com.baldree.database;

/*
 * Alexander Baldree
 * July 8, 2026
 * Module 7 Project Part 2
 * Creates the movies database table for the Module 5, 6, and 7 project.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class AlexCreateTable {

    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/CSD430?useSSL=false";
        String user = "student1";
        String password = "pass";

        String createTableSql = "CREATE TABLE IF NOT EXISTS alexmoviesdata (" +
                "movie_id INT AUTO_INCREMENT PRIMARY KEY, " +
                "title VARCHAR(100) NOT NULL, " +
                "director VARCHAR(100) NOT NULL, " +
                "release_year INT NOT NULL, " +
                "genre VARCHAR(50) NOT NULL, " +
                "rating VARCHAR(10) NOT NULL" +
                ")";

        try {
            Class.forName("com.mysql.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(url, user, password);
                    Statement statement = connection.createStatement()) {

                statement.executeUpdate(createTableSql);
                System.out.println("alexmoviesdata table created successfully.");
            }

        } catch (ClassNotFoundException | SQLException error) {
            System.out.println("Error creating the table.");
        }
    }
}
