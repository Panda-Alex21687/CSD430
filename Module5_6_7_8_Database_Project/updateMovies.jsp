<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%--
    Alexander Baldree
    July 17, 2026
    Module 8 Project Part 3
    Updates the selected movie record and displays the updated data in a table.
--%>

<%
    request.setCharacterEncoding("UTF-8");

    String databaseUrl = "jdbc:mysql://localhost:3306/CSD430?useSSL=false";
    String databaseUser = "student1";
    String databasePassword = "pass";

    String movieIdText = request.getParameter("movie_id");
    String title = request.getParameter("title");
    String director = request.getParameter("director");
    String releaseYearText = request.getParameter("release_year");
    String genre = request.getParameter("genre");
    String rating = request.getParameter("rating");

    int movieId = 0;
    int releaseYear = 0;

    String updatedTitle = "";
    String updatedDirector = "";
    int updatedReleaseYear = 0;
    String updatedGenre = "";
    String updatedRating = "";
    String message = "";

    Connection connection = null;
    PreparedStatement updateStatement = null;
    PreparedStatement selectStatement = null;
    ResultSet resultSet = null;

    try {
        movieId = Integer.parseInt(movieIdText);
        releaseYear = Integer.parseInt(releaseYearText);

        Class.forName("com.mysql.jdbc.Driver");

        connection = DriverManager.getConnection(databaseUrl, databaseUser, databasePassword);

        String updateSql = "UPDATE alexmoviesdata "
                + "SET title = ?, director = ?, release_year = ?, genre = ?, rating = ? "
                + "WHERE movie_id = ?";

        updateStatement = connection.prepareStatement(updateSql);
        updateStatement.setString(1, title);
        updateStatement.setString(2, director);
        updateStatement.setInt(3, releaseYear);
        updateStatement.setString(4, genre);
        updateStatement.setString(5, rating);
        updateStatement.setInt(6, movieId);

        updateStatement.executeUpdate();

        String selectSql = "SELECT movie_id, title, director, release_year, genre, rating "
                + "FROM alexmoviesdata WHERE movie_id = ?";

        selectStatement = connection.prepareStatement(selectSql);
        selectStatement.setInt(1, movieId);

        resultSet = selectStatement.executeQuery();

        if (resultSet.next()) {
            updatedTitle = resultSet.getString("title");
            updatedDirector = resultSet.getString("director");
            updatedReleaseYear = resultSet.getInt("release_year");
            updatedGenre = resultSet.getString("genre");
            updatedRating = resultSet.getString("rating");
            message = "Movie record updated successfully.";
        } else {
            message = "The movie record could not be found after the update.";
        }

    } catch (Exception error) {
        message = "Database error: " + error.getMessage();

    } finally {
        if (resultSet != null) {
            resultSet.close();
        }

        if (selectStatement != null) {
            selectStatement.close();
        }

        if (updateStatement != null) {
            updateStatement.close();
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
    <title>Updated Movie Record</title>
    <link rel="stylesheet" href="alexstyle.css">
</head>
<body>

    <div class="container">
        <h1>Updated Movie Record</h1>

        <p>
            This page displays the updated movie record after the user submits changes.
        </p>

        <p class="message"><%= message %></p>

        <% if (movieId > 0 && updatedTitle != null && !updatedTitle.equals("")) { %>
            <table>
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
                    <tr>
                        <td><%= movieId %></td>
                        <td><%= updatedTitle %></td>
                        <td><%= updatedDirector %></td>
                        <td><%= updatedReleaseYear %></td>
                        <td><%= updatedGenre %></td>
                        <td><%= updatedRating %></td>
                    </tr>
                </tbody>
            </table>
        <% } %>

        <p>
            <a href="index.jsp">Update Another Record</a> |
            <a href="displayMovies.jsp">View All Movie Records</a>
        </p>
    </div>

</body>
</html>