<%-- 
Rachel Theis
Module 3 Assignment
CSD 430
6.8.25
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rachel's Restaurant</title>
</head>
<body>
    <h1>Rachel's Restaurant - Feedback Form</h1>
    <p>Thank you for visiting Rachel's Restaurant! We appreciate your patronage! Please tell us about your recent dining experience.</p>

    <form action="restaurant_survey_results.jsp" method="post">
        <!-- Field 1: Customer's Name -->
        <label for="name">First & Last Name:</label>
        <input type="text" id="name" name="name" required><br><br>

        <!-- Field 2: Customer's Email Address -->
        <label for="email">Email Address:</label>
        <input type="email" id="email" name="email"><br><br>

        <!-- Field 3: Meal Type (Drop Down) -->
        <label for="meal">Service Type:</label>
        <select name="meal" id="meal">
            <option value="Breakfast">Breakfast</option>
            <option value="Lunch">Lunch</option>
            <option value="Dinner">Dinner</option>
            <option value="Happy Hour Only">Happy Hour</option>
        </select><br><br>

        <!-- Field 4: Rating (Radio Buttons) -->
        <label>Service Rating:</label><br>
        <input type="radio" name="rating" value="Excellent" required> Excellent<br>
        <input type="radio" name="rating" value="Good"> Good<br>
        <input type="radio" name="rating" value="Fair"> Average<br>
        <input type="radio" name="rating" value="Poor"> Poor<br><br>
        
        <!-- Field 5: How likely will you return?(Drop Down) -->
        <label for="returnLikelihood">How likely are you to return? </label>
        <select name="returnLikelihood" id="returnLikelihood" required>
        <option value="" disabled selected>Select one</option>
        <option value="Very Likely">Very Likely</option>
        <option value="Likely">Likely</option>
        <option value="Neutral">Neutral</option>
        <option value="Unlikely">Unlikely</option>
        <option value="Very Unlikely">Very Unlikely</option>
        </select><br><br>
    

        <!-- Field 5: Additional Comments (textarea) -->
        <label for="comments">Additional Comments:</label><br>
        <textarea id="comments" name="comments" rows="5" cols="30"></textarea><br><br>

        <input type="submit" value="Submit Feedback">
    </form>
</body>
</html>
