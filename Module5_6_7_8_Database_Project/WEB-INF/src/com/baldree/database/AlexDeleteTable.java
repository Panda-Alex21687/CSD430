package com.baldree.database;

/*
 * Alexander Baldree
 * July 8, 2026
 * Module 7 Project Part 2
 * Deletes the movies database table when the project table needs to be reset.
*/

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class AlexDeleteTable {

    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/CSD430?useSSL=false";
        String user = "student1";
        String password = "pass";

        String deleteTableSql = "DROP TABLE IF EXISTS alexmoviesdata";

        try {
            Class.forName("com.mysql.jdbc.Driver");

            try (Connection connection = DriverManager.getConnection(url, user, password);
                    Statement statement = connection.createStatement()) {

                statement.executeUpdate(deleteTableSql);
                System.out.println("alexmoviesdata table deleted successfully.");
            }

        } catch (ClassNotFoundException | SQLException error) {
            System.out.println("Error deleting the table.");
        }
    }
}
