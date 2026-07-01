<%@ page import="com.baldree.beans.MovieDBBean" %>

<%--
    Alexander Baldree
    CSD430 Module 6 Assignment
    dropTable.jsp
    This page uses the JavaBean to drop the database table.
--%>

<%
    MovieDBBean movieBean = new MovieDBBean();
    String message = "";

    try {
        movieBean.dropTable();
        message = "The alex_movies_data table was dropped successfully.";
    } catch (Exception e) {
        message = "Database error: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Drop Movie Table</title>
    <link rel="stylesheet" href="alexstyle.css">
</head>
<body>
    <h1>Drop Movie Table</h1>
    <p><%= message %></p>
    <p><a href="index.jsp">Return to Home Page</a></p>
</body>
</html>
