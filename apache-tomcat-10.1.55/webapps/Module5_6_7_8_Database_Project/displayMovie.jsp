<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>

<%--
    Alex Baldree
    July 8, 2026
    Module 8 Project Part 3
    Purpose: Displays all movie records currently held in the database table.
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
    <title>All Movie Records</title>
    <link rel="stylesheet" href="alexstyle.css">
</head>
<body>

    <div class="container">
        <h1>All Movie Records</h1>

        <p>
            The table below displays all current records from the movie database table.
            Each field is shown in a separate table column.
        </p>

        <% if (!message.equals("")) { %>
            <p class="message"><%= message %></p>
        <% } %>

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
                <%
                    try {
                        Class.forName("com.mysql.jdbc.Driver");

                        connection = DriverManager.getConnection(databaseUrl, databaseUser, databasePassword);
                        statement = connection.createStatement();

                        String selectSql = "SELECT movie_id, title, director, release_year, genre, rating "
                                + "FROM alexmoviesdata ORDER BY movie_id";

                        resultSet = statement.executeQuery(selectSql);

                        while (resultSet.next()) {
                %>
                            <tr>
                                <td><%= resultSet.getInt("movie_id") %></td>
                                <td><%= resultSet.getString("title") %></td>
                                <td><%= resultSet.getString("director") %></td>
                                <td><%= resultSet.getInt("release_year") %></td>
                                <td><%= resultSet.getString("genre") %></td>
                                <td><%= resultSet.getString("rating") %></td>
                            </tr>
                <%
                        }

                    } catch (Exception error) {
                %>
                        <tr>
                            <td colspan="6">Database error: <%= error.getMessage() %></td>
                        </tr>
                <%
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
            </tbody>
        </table>

        <p>
            <a href="index.jsp">Return to Update Page</a>
        </p>
    </div>

</body>
</html>