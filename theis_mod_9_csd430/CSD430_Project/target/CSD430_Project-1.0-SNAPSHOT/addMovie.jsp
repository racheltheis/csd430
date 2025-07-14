<%--
* Rachel Theis
* Module 7 Assignment
* CSD 430
* 6.29.25
--%>

<%@ page import="java.sql.*, database.MoviesDbBean" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add a Movie</title>
</head>
<body>
    <h1>Add a new movie using the form below:</h1>

    <form method="post" action="addMovie.jsp">
        <label>Title:</label>
        <input type="text" name="title" required><br><br>

        <label>Year Released:</label>
        <input type="number" name="year_released" required><br><br>

        <label>Genre:</label>
        <input type="text" name="genre" required><br><br>

        <label>Director:</label>
        <input type="text" name="director" required><br><br>

        <label>Rating:</label>
        <input type="number" name="rating" step="0.1" required><br><br>

        <input type="submit" value="Add Movie">
    </form>

    <hr>
    <h2>All Movies in Database</h2>

    <%
        String title = request.getParameter("title");
        if (title != null && !title.isEmpty()) {
            int year = Integer.parseInt(request.getParameter("year_released"));
            String genre = request.getParameter("genre");
            String director = request.getParameter("director");
            double rating = Double.parseDouble(request.getParameter("rating"));

            MoviesDbBean bean = new MoviesDbBean();
            bean.addMovie(title, year, genre, director, rating);
        }

        MoviesDbBean displayBean = new MoviesDbBean();
        out.print(displayBean.readAll());
    %>
</body>
</html>

