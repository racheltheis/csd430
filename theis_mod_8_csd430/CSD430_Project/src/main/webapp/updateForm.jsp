<%-- 
Rachel Theis
Module 8 Assignment
CSD 430
7.6.25
--%>

<%@ page import="java.sql.*, database.MoviesDbBean" %>
<html>
<head><title>Edit Movie</title></head>
<body>
<%
    int id = Integer.parseInt(request.getParameter("movieId"));
    MoviesDbBean bean = new MoviesDbBean();
    ResultSet rs = bean.getMovieById(id);

    if (rs.next()) {
%>
    <h2>Update Movie ID: <%= id %></h2>
    <form action="updateResult.jsp" method="post">
        <input type="hidden" name="id" value="<%= id %>">
        Title: <input type="text" name="title" value="<%= rs.getString("title") %>"><br>
        Year Released: <input type="text" name="year_released" value="<%= rs.getInt("year_released") %>"><br>
        Genre: <input type="text" name="genre" value="<%= rs.getString("genre") %>"><br>
        Director: <input type="text" name="director" value="<%= rs.getString("director") %>"><br>
        Rating: <input type="text" name="rating" value="<%= rs.getDouble("rating") %>"><br>
        <input type="submit" value="Update">
    </form>
<%
    } else {
        out.print("Movie not found.");
    }
    bean.close();
%>
</body>
</html>
