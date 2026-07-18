<%@ page import="com.baldree.beans.MovieDBBean" %>
<%@ page import="com.baldree.beans.MovieRecord" %>

<%--
    Alexander Baldree
    CSD430 Module 6 Assignment
    displayMovie.jsp
    This page receives the selected movie_id and displays the matching database record.
--%>

<%
    MovieDBBean movieBean = new MovieDBBean();
    MovieRecord movie = null;
    String message = "";
    int selectedMovieId = 0;

    try {
        String movieIdValue = request.getParameter("movieId");

        if (movieIdValue != null && !movieIdValue.equals("")) {
            selectedMovieId = Integer.parseInt(movieIdValue);
            movie = movieBean.getMovieById(selectedMovieId);
        } else {
            message = "No movie ID was selected.";
        }
    } catch (Exception e) {
        message = "Database error: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Selected Movie Record</title>
    <link rel="stylesheet" href="alexstyle.css">
</head>
<body>
    <h1>Selected Movie Record</h1>

    <p>
        The table below displays one movie record selected from the alex_movies_data table.
        Each database field is shown in its own table column.
    </p>

    <% if (!message.equals("")) { %>
        <p class="error"><%= message %></p>
    <% } %>

    <% if (movie != null) { %>
        <table>
            <thead>
                <tr>
                    <th>Movie ID</th>
                    <th>Title</th>
                    <th>Genre</th>
                    <th>Release Year</th>
                    <th>Rating</th>
                    <th>Director</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%= movie.getMovieId() %></td>
                    <td><%= movie.getTitle() %></td>
                    <td><%= movie.getGenre() %></td>
                    <td><%= movie.getReleaseYear() %></td>
                    <td><%= movie.getRating() %></td>
                    <td><%= movie.getDirector() %></td>
                </tr>
            </tbody>
        </table>
    <% } else if (message.equals("")) { %>
        <p>No record was found for the selected movie ID.</p>
    <% } %>

    <p><a href="index.jsp">Return to Movie Selection</a></p>
</body>
</html>
