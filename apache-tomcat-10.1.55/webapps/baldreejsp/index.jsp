<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My First JSP Page</title>
</head>
<body>
    <h1>My First JSP Application</h1>

    <p>This page uses both HTML and Java code.</p>

    <%
        String studentName = "Alex Baldree";
        String course = "CSD430";
        java.time.LocalDate today = java.time.LocalDate.now();

        int numberOne = 10;
        int numberTwo = 15;
        int total = numberOne + numberTwo;
    %>

    <h2>Student Information</h2>
    <p><strong>Name:</strong> <%= studentName %></p>
    <p><strong>Course:</strong> <%= course %></p>
    <p><strong>Date:</strong> <%= today %></p>

    <h2>Java Calculation Example</h2>
    <p><%= numberOne %> + <%= numberTwo %> = <%= total %></p>

    <footer>
        <p>JSP application successfully running on Jakarta Tomcat.</p>
    </footer>
</body>
</html>