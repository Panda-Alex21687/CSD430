<%-- 
    Name: Alexander Baldree
    Assignment: Version Control / JSP Form Assignment
    File: results.jsp
    Description: This JSP file receives form data from index.jsp.
    Scriptlets are used to hold Java code and process the submitted data.
    HTML tags are kept outside of the Java Scriptlet sections.
--%>

<%
    // Collect form data submitted from index.jsp
    String customerName = request.getParameter("customerName");
    String email = request.getParameter("email");
    String visitDate = request.getParameter("visitDate");
    String mealType = request.getParameter("mealType");
    String foodRating = request.getParameter("foodRating");
    String serviceRating = request.getParameter("serviceRating");
    String comments = request.getParameter("comments");

    // Collect checkbox values
    String[] selectedRecommendations = request.getParameterValues("recommendations");
    String recommendations = "";

    if (selectedRecommendations != null) {
        for (int i = 0; i < selectedRecommendations.length; i++) {
            recommendations += selectedRecommendations[i];

            if (i < selectedRecommendations.length - 1) {
                recommendations += ", ";
            }
        }
    } else {
        recommendations = "No recommendations selected";
    }

    // Check for empty values and replace them with a default message
    if (customerName == null || customerName.trim().equals("")) {
        customerName = "Not provided";
    }

    if (email == null || email.trim().equals("")) {
        email = "Not provided";
    }

    if (visitDate == null || visitDate.trim().equals("")) {
        visitDate = "Not provided";
    }

    if (mealType == null || mealType.trim().equals("")) {
        mealType = "Not provided";
    }

    if (foodRating == null || foodRating.trim().equals("")) {
        foodRating = "Not provided";
    }

    if (serviceRating == null || serviceRating.trim().equals("")) {
        serviceRating = "Not provided";
    }

    if (comments == null || comments.trim().equals("")) {
        comments = "Not provided";
    }

    // Basic cleanup to help prevent HTML from being displayed as code
    customerName = customerName.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
    email = email.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
    visitDate = visitDate.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
    mealType = mealType.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
    foodRating = foodRating.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
    serviceRating = serviceRating.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
    recommendations = recommendations.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
    comments = comments.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Feedback Results</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>

    <div class="container">
        <h1>Restaurant Feedback Results</h1>

        <p>
            The table below displays the restaurant feedback data submitted by the user.
            Each row includes the field name, a short description, and the submitted response.
        </p>

        <table>
            <tr>
                <th>Field</th>
                <th>Record Description</th>
                <th>Submitted Data</th>
            </tr>

            <tr>
                <td>Customer Name</td>
                <td>Name of the customer who completed the feedback form.</td>
                <td><%= customerName %></td>
            </tr>

            <tr>
                <td>Email Address</td>
                <td>Contact email entered by the customer.</td>
                <td><%= email %></td>
            </tr>

            <tr>
                <td>Date of Visit</td>
                <td>The date the customer visited the restaurant.</td>
                <td><%= visitDate %></td>
            </tr>

            <tr>
                <td>Meal Type</td>
                <td>The type of meal the customer received.</td>
                <td><%= mealType %></td>
            </tr>

            <tr>
                <td>Food Rating</td>
                <td>Customer rating for the quality of the food.</td>
                <td><%= foodRating %></td>
            </tr>

            <tr>
                <td>Service Rating</td>
                <td>Customer rating for the restaurant service.</td>
                <td><%= serviceRating %></td>
            </tr>

            <tr>
                <td>Recommendations</td>
                <td>Items the customer would recommend to others.</td>
                <td><%= recommendations %></td>
            </tr>

            <tr>
                <td>Additional Comments</td>
                <td>Extra feedback written by the customer.</td>
                <td><%= comments %></td>
            </tr>
        </table>

        <div class="button-area">
            <a href="index.jsp" class="button-link">Return to Form</a>
        </div>
    </div>

</body>
</html>