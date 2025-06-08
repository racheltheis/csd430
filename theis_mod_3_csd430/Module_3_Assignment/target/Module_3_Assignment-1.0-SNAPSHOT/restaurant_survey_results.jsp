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
    <title>Success! Feedback Received</title>
</head>
<body>
    <h1>Your feedback was successfully submitted.</h1>
    <p>Here's what Rachel's Restaurant will see:</p>

    <%
        // Gathering Data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String meal = request.getParameter("meal");
        String rating = request.getParameter("rating");
        String returnLikelihood = request.getParameter("returnLikelihood");
        String comments = request.getParameter("comments");
    %>

    <table border="1" cellpadding="8" cellspacing="0">
        <tr><th>Field</th><th>Your Response</th></tr>
        <tr><td>Name</td><td><%= name %></td></tr>
        <tr><td>Email</td><td><%= email %></td></tr>
        <tr><td>Meal Ordered</td><td><%= meal %></td></tr>
        <tr><td>Service Rating</td><td><%= rating %></td></tr>
        <tr><td>Likelihood to Return</td><td><%= returnLikelihood %></td></tr>
        <tr><td>Comments</td><td><%= comments %></td></tr>
    </table>

    <p>Your feedback is sincerely appreciated! We hope to see you again soon!</p>
</body>
</html>
