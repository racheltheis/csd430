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
    <h1>Add a new movie using below form:</h1>

    <form method="post" action="addMovie.jsp">
        <label>Movie Name:</label>
        <input type="text" name="movie_name" required><br><br>

        <label>Year Released:</label>
        <input type="number" name="year_released" required><br><br>

        <label>Genre:</label>
        <input type="text" name="genre" required><br><br>

        <label>Director:</label>
        <input type="text" name="director" required><br><br>

        <label>IMDb Rating:</label>
        <input type="number" name="imdb_rating" step="0.1" required><br><br>

        <input type="submit" value="Add Movie">
    </form>

    <hr>
    <h2>All Movies in Database</h2>

    <%
        String name = request.getParameter("movie_name");
        if (name != null) {
            int year = Integer.parseInt(request.getParameter("year_released"));
            String genre = request.getParameter("genre");
            String director = request.getParameter("director");
            double imdbRating = Double.parseDouble(request.getParameter("imdb_rating"));

            MoviesDbBean bean = new MoviesDbBean();
            bean.addMovie(name, year, genre, director, imdbRating);
        }

        MoviesDbBean displayBean = new MoviesDbBean();
        out.print(displayBean.readAll());
    %>
</body>
</html>
