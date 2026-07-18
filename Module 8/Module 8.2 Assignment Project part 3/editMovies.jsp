<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%--
    Alexander Baldree
    July 17, 2026
    Module 8 Project Part 3
    Displays the selected movie record in a form so the user can update it.
--%>

<%
    String databaseUrl = "jdbc:mysql://localhost:3306/CSD430?useSSL=false";
    String databaseUser = "student1";
    String databasePassword = "pass";

    String movieIdText = request.getParameter("movie_id");

    int movieId = 0;
    String title = "";
    String director = "";
    int releaseYear = 0;
    String genre = "";
    String rating = "";
    String message = "";

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    try {
        if (movieIdText != null && !movieIdText.trim().equals("")) {
            movieId = Integer.parseInt(movieIdText);

            Class.forName("com.mysql.jdbc.Driver");

            connection = DriverManager.getConnection(databaseUrl, databaseUser, databasePassword);

            String selectSql = "SELECT movie_id, title, director, release_year, genre, rating "
                    + "FROM alexmoviesdata WHERE movie_id = ?";

            preparedStatement = connection.prepareStatement(selectSql);
            preparedStatement.setInt(1, movieId);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                title = resultSet.getString("title");
                director = resultSet.getString("director");
                releaseYear = resultSet.getInt("release_year");
                genre = resultSet.getString("genre");
                rating = resultSet.getString("rating");
            } else {
                message = "No movie record was found for that ID.";
            }
        } else {
            message = "No movie ID was selected.";
        }

    } catch (Exception error) {
        message = "Database error: " + error.getMessage();

    } finally {
        if (resultSet != null) {
            resultSet.close();
        }

        if (preparedStatement != null) {
            preparedStatement.close();
        }

        if (connection != null) {
            connection.close();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Movie Record</title>
    <link rel="stylesheet" href="alexstyle.css">
</head>
<body>

    <div class="container">
        <h1>Edit Movie Record</h1>

        <p>
            The movie ID is the key field, so it is displayed but not editable. The remaining
            fields can be changed and submitted to update the database record.
        </p>

        <% if (!message.equals("")) { %>
            <p class="message"><%= message %></p>
            <p><a href="index.jsp">Return to Movie Selection</a></p>
        <% } else { %>

            <form action="updateMovie.jsp" method="post">
                <label>Movie ID:</label>
                <span class="readonly-field"><%= movieId %></span>
                <input type="hidden" name="movie_id" value="<%= movieId %>">
                <br><br>

                <label for="title">Movie Title:</label>
                <input type="text" id="title" name="title" value="<%= title %>" required>
                <br><br>

                <label for="director">Director:</label>
                <input type="text" id="director" name="director" value="<%= director %>" required>
                <br><br>

                <label for="release_year">Release Year:</label>
                <input type="number" id="release_year" name="release_year" value="<%= releaseYear %>" required>
                <br><br>

                <label for="genre">Genre:</label>
                <input type="text" id="genre" name="genre" value="<%= genre %>" required>
                <br><br>

                <label for="rating">Rating:</label>
                <input type="text" id="rating" name="rating" value="<%= rating %>" required>
                <br><br>

                <input type="submit" value="Update Movie Record">
            </form>

        <% } %>
    </div>

</body>
</html>