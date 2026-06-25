<%--
    Name: Alexander Baldree
    Date: June 24, 2026
    Assignment: CSD430 JavaBean Data Display Assignment
    This JSP page creates JavaBean objects and displays their data in an HTML table.
--%>

<%@ page import="com.baldree.beans.TravelRecordBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%
    // Create a list to store JavaBean records.
    List<TravelRecordBean> travelRecords = new ArrayList<>();

    // Add travel records using the JavaBean constructor.
    travelRecords.add(new TravelRecordBean("Tennessee", "State", "Music, barbecue, and mountains", "Visiting Memphis", 1998));
    travelRecords.add(new TravelRecordBean("Florida", "State", "Beaches and theme parks", "Going to the beach", 2000));
    travelRecords.add(new TravelRecordBean("Georgia", "State", "Atlanta and southern history", "Exploring Atlanta", 2010));
    travelRecords.add(new TravelRecordBean("Texas", "State", "Large cities, food, and culture", "Trying local food", 2007));
    travelRecords.add(new TravelRecordBean("Mississippi", "State", "Southern culture and history", "Taking a road trip", 2005));
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Travel Records JavaBean Display</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>

    <div class="container">

        <h1>Travel Records Using a JavaBean</h1>

        <p class="description">
            This page displays travel information stored inside JavaBean objects.
            Each record includes the place name, location type, what the place is known for,
            my favorite activity, and the year visited.
        </p>

        <h2>Field Descriptions</h2>

        <table>
            <tr>
                <th>Field Name</th>
                <th>Description</th>
            </tr>
            <tr>
                <td>Place Name</td>
                <td>The name of the state or place visited.</td>
            </tr>
            <tr>
                <td>Location Type</td>
                <td>Identifies whether the location is a state, country, or another type of place.</td>
            </tr>
            <tr>
                <td>Best Known For</td>
                <td>Describes something the location is commonly known for.</td>
            </tr>
            <tr>
                <td>Favorite Activity</td>
                <td>Shows what I enjoyed most while visiting that location.</td>
            </tr>
            <tr>
                <td>Year Visited</td>
                <td>The year I visited the location.</td>
            </tr>
        </table>

        <h2>Travel Record Data</h2>

        <table>
            <tr>
                <th>Record #</th>
                <th>Place Name</th>
                <th>Location Type</th>
                <th>Best Known For</th>
                <th>Favorite Activity</th>
                <th>Year Visited</th>
            </tr>

            <%
                // Loop through the JavaBean records and display each one in the table.
                for (int i = 0; i < travelRecords.size(); i++) {
                    TravelRecordBean record = travelRecords.get(i);
            %>

            <tr>
                <td><%= i + 1 %></td>
                <td><%= record.getPlaceName() %></td>
                <td><%= record.getLocationType() %></td>
                <td><%= record.getBestKnownFor() %></td>
                <td><%= record.getFavoriteActivity() %></td>
                <td><%= record.getYearVisited() %></td>
            </tr>

            <%
                }
            %>

        </table>

        <p class="summary">
            This assignment shows how a JavaBean can store data separately from the JSP page. The JSP page uses scriptlets to create JavaBean records and then displays the information in a formatted HTML table.
        </p>

    </div>

</body>
</html>