<%-- 
    Name: Alexander Baldree
    Assignment: Version Control / JSP Form Assignment
    File: index.jsp
    Description: This JSP file displays a restaurant feedback form.
    The form collects user input and sends the data to results.jsp.
--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Restaurant Feedback Form</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>

    <div class="container">
        <h1>Restaurant Experience Feedback Form</h1>

        <p>
            This form gathers feedback about a customer's restaurant visit.
            The information collected includes customer details, meal type,
            ratings, recommendations, and written comments.
        </p>

        <form action="results.jsp" method="post">

            <label for="customerName">Customer Name:</label>
            <input type="text" id="customerName" name="customerName" required>

            <label for="email">Email Address:</label>
            <input type="email" id="email" name="email" required>

            <label for="visitDate">Date of Visit:</label>
            <input type="date" id="visitDate" name="visitDate" required>

            <label for="mealType">Meal Type:</label>
            <select id="mealType" name="mealType" required>
                <option value="">Select a meal type</option>
                <option value="Breakfast">Breakfast</option>
                <option value="Lunch">Lunch</option>
                <option value="Dinner">Dinner</option>
                <option value="Dessert">Dessert</option>
            </select>

            <p class="section-label">Food Rating:</p>
            <div class="radio-group">
                <input type="radio" id="foodExcellent" name="foodRating" value="Excellent" required>
                <label for="foodExcellent">Excellent</label>

                <input type="radio" id="foodGood" name="foodRating" value="Good">
                <label for="foodGood">Good</label>

                <input type="radio" id="foodFair" name="foodRating" value="Fair">
                <label for="foodFair">Fair</label>

                <input type="radio" id="foodPoor" name="foodRating" value="Poor">
                <label for="foodPoor">Poor</label>
            </div>

            <p class="section-label">Service Rating:</p>
            <div class="radio-group">
                <input type="radio" id="serviceExcellent" name="serviceRating" value="Excellent" required>
                <label for="serviceExcellent">Excellent</label>

                <input type="radio" id="serviceGood" name="serviceRating" value="Good">
                <label for="serviceGood">Good</label>

                <input type="radio" id="serviceFair" name="serviceRating" value="Fair">
                <label for="serviceFair">Fair</label>

                <input type="radio" id="servicePoor" name="serviceRating" value="Poor">
                <label for="servicePoor">Poor</label>
            </div>

            <p class="section-label">What would you recommend?</p>
            <div class="checkbox-group">
                <input type="checkbox" id="appetizers" name="recommendations" value="Appetizers">
                <label for="appetizers">Appetizers</label>

                <input type="checkbox" id="mainCourse" name="recommendations" value="Main Course">
                <label for="mainCourse">Main Course</label>

                <input type="checkbox" id="desserts" name="recommendations" value="Desserts">
                <label for="desserts">Desserts</label>

                <input type="checkbox" id="drinks" name="recommendations" value="Drinks">
                <label for="drinks">Drinks</label>
            </div>

            <label for="comments">Additional Comments:</label>
            <textarea id="comments" name="comments" rows="5" required></textarea>

            <div class="button-area">
                <input type="submit" value="Submit Feedback">
                <input type="reset" value="Clear Form">
            </div>

        </form>
    </div>

</body>
</html>