<%@ page import="com.baldree.beans.MovieDBBean" %>
<%@ page import="java.util.ArrayList" %>

<%--
    Alexander Baldree
    CSD430 Module 6 Assignment
    index.jsp
    This page initializes the form and displays a dropdown menu of movie_id values from the database.
--%>

<%
    MovieDBBean movieBean = new MovieDBBean();
    ArrayList<Integer> movieIds = new ArrayList<Integer>();
    String message = "";

    try {
        movieBean.createDatabaseAndTable();

        if (movieBean.getMovieIds().size() == 0) {
            movieBean.populateTable();
        }

        movieIds = movieBean.getMovieIds();
    } catch (Exception e) {
        message = "Database error: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Alex Baldree Movie Database</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>Alex Baldree - Movie Database Lookup</h1>

    <p>
        This page uses a JavaBean to connect to the CSD430 MySQL database.
        The dropdown menu lists the unique primary key values from the alex_movies_data table.
        After a movie ID is selected, the matching database record is displayed in table format.
    </p>

    <h2>Select a Movie Record</h2>

    <% if (!message.equals("")) { %>
        <p class="error"><%= message %></p>
    <% } %>

    <form action="displayMovie.jsp" method="post">
        <label for="movieId">Movie ID:</label>
        <select name="movieId" id="movieId">
            <% for (Integer id : movieIds) { %>
                <option value="<%= id %>"><%= id %></option>
            <% } %>
        </select>

        <input type="submit" value="Display Movie">
    </form>

    <h2>Module 6 Project Links</h2>
    <ul>
        <li><a href="index.jsp">Movie Dropdown Form</a></li>
        <li><a href="createTable.jsp">Create Table Using JavaBean</a></li>
        <li><a href="populateTable.jsp">Populate Table Using JavaBean</a></li>
        <li><a href="dropTable.jsp">Drop Table Using JavaBean</a></li>
    </ul>
</body>
</html>
