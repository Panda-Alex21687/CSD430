<%@ page import="com.baldree.beans.MovieDBBean" %>

<%--
    Alexander Baldree
    CSD430 Module 6 Assignment
    createTable.jsp
    This page uses the JavaBean to create the database table.
--%>

<%
    MovieDBBean movieBean = new MovieDBBean();
    String message = "";

    try {
        movieBean.createDatabaseAndTable();
        message = "The CSD430 database and alex_movies_data table were created successfully.";
    } catch (Exception e) {
        message = "Database error: " + e.getMessage();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Movie Table</title>
    <link rel="stylesheet" href="alexstyle.css">
</head>
<body>
    <h1>Create Movie Table</h1>
    <p><%= message %></p>
    <p><a href="index.jsp">Return to Home Page</a></p>
</body>
</html>
