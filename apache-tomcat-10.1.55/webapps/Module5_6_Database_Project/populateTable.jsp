<%@ page import="com.baldree.beans.MovieDBBean" %>

<%--
    Alexander Baldree
    CSD430 Module 6 Assignment
    populateTable.jsp
    This page uses the JavaBean to populate the database table with movie records.
--%>

<%
    MovieDBBean movieBean = new MovieDBBean();
    String message = "";

    try {
        movieBean.populateTable();
        message = "The alex_movies_data table was populated successfully with 10 movie records.";
    } catch (Exception e) {
        message = "Database error: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Populate Movie Table</title>
    <link rel="stylesheet" href="alexstyle.css">
</head>
<body>
    <h1>Populate Movie Table</h1>
    <p><%= message %></p>
    <p><a href="index.jsp">Return to Home Page</a></p>
</body>
</html>
