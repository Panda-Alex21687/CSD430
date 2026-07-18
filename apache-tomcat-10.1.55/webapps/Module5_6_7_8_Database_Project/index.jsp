<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.util.ArrayList" %>

<%--
    Alexander Baldree
    July 8, 2026
    Module 7 Project Part 2
    Allows a user to add a movie record and displays all movie records from the database.
--%>

<%
    request.setCharacterEncoding("UTF-8");

    String databaseUrl = "jdbc:mysql://localhost:3306/CSD430?useSSL=false";
    String databaseUser = "student1";
    String databasePassword = "pass";

    String message = "";
    ArrayList<String[]> movieRecords = new ArrayList<String[]>();

    try {
        Class.forName("com.mysql.jdbc.Driver");

        Connection connection = DriverManager.getConnection(databaseUrl, databaseUser, databasePassword);

        // This section adds a new movie record when the form is submitted.
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String title = request.getParameter("title");
            String director = request.getParameter("director");
            String releaseYearText = request.getParameter("release_year");
            String genre = request.getParameter("genre");
            String rating = request.getParameter("rating");

            if (title != null && director != null && releaseYearText != null && genre != null && rating != null
                    && !title.trim().isEmpty()
                    && !director.trim().isEmpty()
                    && !releaseYearText.trim().isEmpty()
                    && !genre.trim().isEmpty()
                    && !rating.trim().isEmpty()) {

                int releaseYear = Integer.parseInt(releaseYearText);

                String insertSql = "INSERT INTO alexmoviesdata "
                        + "(title, director, release_year, genre, rating) "
                        + "VALUES (?, ?, ?, ?, ?)";

                PreparedStatement insertStatement = connection.prepareStatement(insertSql);
                insertStatement.setString(1, title);
                insertStatement.setString(2, director);
                insertStatement.setInt(3, releaseYear);
                insertStatement.setString(4, genre);
                insertStatement.setString(5, rating);
                insertStatement.executeUpdate();
                insertStatement.close();

                message = "New movie record added successfully.";
            } else {
                message = "Please complete every field before submitting the form.";
            }
        }

        // This section collects all movie records so they can be displayed in the HTML table.
        String selectSql = "SELECT movie_id, title, director, release_year, genre, rating "
                + "FROM alexmoviesdata ORDER BY movie_id";

        Statement selectStatement = connection.createStatement();
        ResultSet resultSet = selectStatement.executeQuery(selectSql);

        while (resultSet.next()) {
            String[] row = new String[6];

            row[0] = String.valueOf(resultSet.getInt("movie_id"));
            row[1] = resultSet.getString("title");
            row[2] = resultSet.getString("director");
            row[3] = String.valueOf(resultSet.getInt("release_year"));
            row[4] = resultSet.getString("genre");
            row[5] = resultSet.getString("rating");

            movieRecords.add(row);
        }

        resultSet.close();
        selectStatement.close();
        connection.close();

    } catch (Exception error) {
        message = "Database error: " + error.getMessage();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Alex Baldree Movie Database</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

    <h1>Alex Baldree Movie Database</h1>

    <p>
        This page is part of my Module 7 database project. It allows a user to add a new
        movie record to the existing CSD430 database and then displays all current records
        from the movie table.
    </p>

    <h2>Add a New Movie Record</h2>

    <p>
        Complete each field below. The movie ID is not entered by the user because it is
        created automatically by the database when the form is submitted.
    </p>

    <% if (message != null && !message.isEmpty()) { %>
        <p><strong><%= message %></strong></p>
    <% } %>

    <form method="post" action="index.jsp">
        <label for="title">Movie Title:</label>
        <input type="text" id="title" name="title" required>
        <br><br>

        <label for="director">Director:</label>
        <input type="text" id="director" name="director" required>
        <br><br>

        <label for="release_year">Release Year:</label>
        <input type="number" id="release_year" name="release_year" required>
        <br><br>

        <label for="genre">Genre:</label>
        <input type="text" id="genre" name="genre" required>
        <br><br>

        <label for="rating">Rating:</label>
        <input type="text" id="rating" name="rating" required>
        <br><br>

        <input type="submit" value="Add Movie Record">
    </form>

    <h2>Current Movie Records</h2>

    <p>
        The table below displays all records currently held in the movie database table.
        Each field is shown in its own column.
    </p>

    <table border="1">
        <thead>
            <tr>
                <th>Movie ID</th>
                <th>Title</th>
                <th>Director</th>
                <th>Release Year</th>
                <th>Genre</th>
                <th>Rating</th>
            </tr>
        </thead>

        <tbody>
            <% for (String[] movie : movieRecords) { %>
                <tr>
                    <td><%= movie[0] %></td>
                    <td><%= movie[1] %></td>
                    <td><%= movie[2] %></td>
                    <td><%= movie[3] %></td>
                    <td><%= movie[4] %></td>
                    <td><%= movie[5] %></td>
                </tr>
            <% } %>
        </tbody>
    </table>

</body>
</html>