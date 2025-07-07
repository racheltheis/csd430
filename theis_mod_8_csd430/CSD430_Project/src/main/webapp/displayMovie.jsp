<%--
* Rachel Theis
* Module 6 Assignment
* CSD 430
* 6.29.25
--%>

<%@ page import="java.sql.*, database.MoviesDbBean" %>
<html>
<head><title>Rachel's Favorite Movies</title></head>
<body>

<%
    String idParam = request.getParameter("movieId");
    MoviesDbBean bean = new MoviesDbBean();

    if (idParam != null) {
        int id = Integer.parseInt(idParam);
        ResultSet rs = bean.getMovieById(id);

        if (rs.next()) {
%>
            <h2>Movie Details</h2>
            <table border="1">
                <thead>
                    <tr>
                        <th>ID</th><th>Title</th><th>Year</th><th>Genre</th><th>Director</th><th>Rating</th>
                    </tr>
                </thead>
                <tr>
                    <td><%= rs.getInt("id") %></td>
                    <td><%= rs.getString("title") %></td>
                    <td><%= rs.getInt("year_released") %></td>
                    <td><%= rs.getString("genre") %></td>
                    <td><%= rs.getString("director") %></td>
                    <td><%= rs.getDouble("rating") %></td>
                </tr>
            </table>
<%
        } else {
            out.print("No record found.");
        }
    } else {
        ResultSet rs = bean.getAllMovies();
%>
        <h2>All Movies</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th><th>Title</th><th>Year</th><th>Genre</th><th>Director</th><th>Rating</th>
                </tr>
            </thead>
<%
        while (rs.next()) {
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
        }
    }

    bean.close();
%>

</table>
<a href="index.jsp">Return to Home</a>
</body>
</html>

