<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>

<%--
    Alexander Baldree
    July 17, 2026
    Module 8 Project Part 3
    Displays a dropdown of movie record IDs so the user can select a record to update.
--%>

<%
    String databaseUrl = "jdbc:mysql://localhost:3306/CSD430?useSSL=false";
    String databaseUser = "student1";
    String databasePassword = "pass";

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
    String message = "";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Movie Record</title>
    <link rel="stylesheet" href="alexstyle.css">
</head>
<body>

    <div class="container">
        <h1>Alex Baldree Movie Database</h1>

        <p>
            This page is part of my Module 8 database project. It allows the user to select
            an existing movie record from the database and update that record.
        </p>

        <h2>Select a Movie Record to Update</h2>

        <p>
            Choose a movie ID from the dropdown menu. The dropdown values come from the key
            values currently stored in the database.
        </p>

        <form action="editMovie.jsp" method="post">
            <label for="movie_id">Movie ID:</label>

            <select name="movie_id" id="movie_id" required>
                <option value="">-- Select a Movie ID --</option>

                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");

                        connection = DriverManager.getConnection(databaseUrl, databaseUser, databasePassword);
                        statement = connection.createStatement();

                        String selectSql = "SELECT movie_id, title FROM alexmoviesdata ORDER BY movie_id";
                        resultSet = statement.executeQuery(selectSql);

                        while (resultSet.next()) {
                            int movieId = resultSet.getInt("movie_id");
                            String title = resultSet.getString("title");
                %>
                            <option value="<%= movieId %>">
                                <%= movieId %> - <%= title %>
                            </option>
                <%
                        }

                    } catch (Exception error) {
                        message = "Database error: " + error.getMessage();

                    } finally {
                        if (resultSet != null) {
                            resultSet.close();
                        }

                        if (statement != null) {
                            statement.close();
                        }

                        if (connection != null) {
                            connection.close();
                        }
                    }
                %>
            </select>

            <br><br>

            <input type="submit" value="Edit Selected Record">
        </form>

        <% if (!message.equals("")) { %>
            <p class="message"><%= message %></p>
        <% } %>

        <p>
            <a href="displayMovies.jsp">View All Movie Records</a>
        </p>
    </div>

</body>
</html>