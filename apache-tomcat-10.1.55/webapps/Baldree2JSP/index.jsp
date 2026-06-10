<%--
    Name: Alexander Baldree
    Date: June 10, 2026
    Assignment: Module 2 JSP Scriptlets Assignment

    Description:
    This JSP page uses Java Scriptlets to store and process data.
    The HTML tags are kept outside of the Scriptlet sections.
    The page displays records about Florida in an HTML table.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    /*
        Java data section:
        This two-dimensional array stores the table records.
        Each record has three fields:
        1. Category
        2. Record Name
        3. Description
    */

    String pageTitle = "Florida Travel Records";

    String dataDescription = "This page displays a small set of records about Florida, "
            + "including places, food, nature, and activities that make the state interesting to visit.";

    String[][] records = {
        {"Attractions", "Orlando Theme Parks", "Florida is known for major theme parks and entertainment areas."},
        {"Attractions", "Kennedy Space Center", "This location shows Florida's connection to space exploration."},
        {"Nature", "Everglades National Park", "The Everglades has wetlands, wildlife, and airboat tours."},
        {"Food", "Key Lime Pie", "This dessert is one of Florida's most recognized foods."},
        {"Beaches", "Clearwater Beach", "Clearwater Beach is known for soft sand, ocean views, and relaxing scenery."}
    };

    String currentCategory = "";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= pageTitle %></title>
    <link rel="stylesheet" href="css/styles.css">
</head>

<body>
    <main class="page-container">
        <header class="page-header">
            <h1><%= pageTitle %></h1>
            <p><%= dataDescription %></p>
        </header>

        <section class="info-card">
            <h2>Field Descriptions</h2>
            <p><strong>Category:</strong> Groups the record by topic.</p>
            <p><strong>Record Name:</strong> Names the specific place, food, or item being described.</p>
            <p><strong>Description:</strong> Explains why the record is important or interesting.</p>
        </section>

        <section class="info-card">
            <h2>Record Description</h2>
            <p>
                The records below are grouped into topical categories. Each row contains three fields
                and gives a short description related to visiting Florida.
            </p>

            <table>
                <thead>
                    <tr>
                        <th>Category</th>
                        <th>Record Name</th>
                        <th>Description</th>
                    </tr>
                </thead>

                <tbody>
                    <% for (int i = 0; i < records.length; i++) { %>

                        <% if (!records[i][0].equals(currentCategory)) { %>
                            <%
                                currentCategory = records[i][0];
                            %>
                            <tr class="category-row">
                                <td colspan="3"><%= currentCategory %></td>
                            </tr>
                        <% } %>

                        <tr>
                            <td><%= records[i][0] %></td>
                            <td><%= records[i][1] %></td>
                            <td><%= records[i][2] %></td>
                        </tr>

                    <% } %>
                </tbody>
            </table>
        </section>

        <footer>
            <p>Created using JSP Scriptlets, HTML, and external CSS.</p>
        </footer>
    </main>
</body>
</html>