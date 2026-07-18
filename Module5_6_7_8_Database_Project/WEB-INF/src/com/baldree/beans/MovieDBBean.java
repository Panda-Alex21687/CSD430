package com.baldree.beans;

/*
 * Alexander Baldree
 * CSD430 Module 6 Assignment
 * MovieDBBean.java
 * This JavaBean connects to the CSD430 database and works with the alex_movies_data table.
 * It can create, populate, drop, list keys, and return one selected movie record.
 */

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class MovieDBBean implements Serializable {
    private final String databaseUrl = "jdbc:mysql://localhost:3306/CSD430";
    private final String serverUrl = "jdbc:mysql://localhost:3306/";
    private final String username = "student1";
    private final String password = "pass";
    private final String tableName = "alex_movies_data";

    public MovieDBBean() {
    }

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(databaseUrl, username, password);
    }

    private Connection getServerConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(serverUrl, username, password);
    }

    public void createDatabaseAndTable() throws SQLException, ClassNotFoundException {
        try (Connection conn = getServerConnection();
                Statement stmt = conn.createStatement()) {

            stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS CSD430");
        }

        try (Connection conn = getConnection();
                Statement stmt = conn.createStatement()) {

            String sql = "CREATE TABLE IF NOT EXISTS " + tableName + " ("
                    + "movie_id INT AUTO_INCREMENT PRIMARY KEY, "
                    + "title VARCHAR(100) NOT NULL, "
                    + "genre VARCHAR(50) NOT NULL, "
                    + "release_year INT NOT NULL, "
                    + "rating VARCHAR(10) NOT NULL, "
                    + "director VARCHAR(100) NOT NULL"
                    + ")";

            stmt.executeUpdate(sql);
        }
    }

    public void populateTable() throws SQLException, ClassNotFoundException {
        createDatabaseAndTable();

        try (Connection conn = getConnection();
                Statement stmt = conn.createStatement()) {

            stmt.executeUpdate("TRUNCATE TABLE " + tableName);

            String sql = "INSERT INTO " + tableName + " (title, genre, release_year, rating, director) VALUES "
                    + "('The Dark Knight', 'Action', 2008, 'PG-13', 'Christopher Nolan'),"
                    + "('Forrest Gump', 'Drama', 1994, 'PG-13', 'Robert Zemeckis'),"
                    + "('Jurassic Park', 'Adventure', 1993, 'PG-13', 'Steven Spielberg'),"
                    + "('Toy Story', 'Animation', 1995, 'G', 'John Lasseter'),"
                    + "('Remember the Titans', 'Sports Drama', 2000, 'PG', 'Boaz Yakin'),"
                    + "('The Avengers', 'Superhero', 2012, 'PG-13', 'Joss Whedon'),"
                    + "('Back to the Future', 'Sci-Fi', 1985, 'PG', 'Robert Zemeckis'),"
                    + "('Spider-Man', 'Superhero', 2002, 'PG-13', 'Sam Raimi'),"
                    + "('The Sandlot', 'Comedy', 1993, 'PG', 'David Mickey Evans'),"
                    + "('Top Gun: Maverick', 'Action', 2022, 'PG-13', 'Joseph Kosinski')";

            stmt.executeUpdate(sql);
        }
    }

    public void dropTable() throws SQLException, ClassNotFoundException {
        try (Connection conn = getConnection();
                Statement stmt = conn.createStatement()) {

            stmt.executeUpdate("DROP TABLE IF EXISTS " + tableName);
        }
    }

    public ArrayList<Integer> getMovieIds() throws SQLException, ClassNotFoundException {
        @SuppressWarnings("Convert2Diamond")
        ArrayList<Integer> movieIds = new ArrayList<Integer>();

        try (Connection conn = getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT movie_id FROM " + tableName + " ORDER BY movie_id")) {

            while (rs.next()) {
                movieIds.add(rs.getInt("movie_id"));
            }
        }

        return movieIds;
    }

    public MovieRecord getMovieById(int movieId) throws SQLException, ClassNotFoundException {
        MovieRecord movie = null;

        String sql = "SELECT movie_id, title, genre, release_year, rating, director "
                + "FROM " + tableName + " WHERE movie_id = ?";

        try (Connection conn = getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, movieId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    movie = new MovieRecord(
                            rs.getInt("movie_id"),
                            rs.getString("title"),
                            rs.getString("genre"),
                            rs.getInt("release_year"),
                            rs.getString("rating"),
                            rs.getString("director"));
                }
            }
        }

        return movie;
    }
}
