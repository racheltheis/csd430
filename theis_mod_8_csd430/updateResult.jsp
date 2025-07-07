<%-- 
Rachel Theis
Module 8 Assignment
CSD 420
7.6.25
--%>

<%@ page import="java.sql.*, database.MoviesDbBean" %>
<html>
<head><title>Update Result</title></head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String title = request.getParameter("title");
    int year = Integer.parseInt(request.getParameter("year_released"));
    String genre = request.getParameter("genre");
    String director = request.getParameter("director");
    double rating = Double.parseDouble(request.getParameter("rating"));

    MoviesDbBean bean = new MoviesDbBean();
    bean.updateMovie(id, title, year, genre, director, rating);

    ResultSet rs = bean.getMovieById(id);
%>
<h2>Success! Updated Movie Record</h2>
<table border="1">
    <thead>
        <tr>
            <th>ID</th><th>Title</th><th>Year</th><th>Genre</th><th>Director</th><th>Rating</th>
        </tr>
    </thead>
    <%
        if (rs.next()) {
    %>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("title") %></td>
            <td><%= rs.getInt("year_released") %></td>
            <td><%= rs.getString("genre") %></td>
            <td><%= rs.getString("director") %></td>
            <td><%= rs.getDouble("rating") %></td>
        </tr>
    <%
        } else {
            out.print("No movie found.");
        }
        bean.close();
    %>
</table>
</body>
</html>
