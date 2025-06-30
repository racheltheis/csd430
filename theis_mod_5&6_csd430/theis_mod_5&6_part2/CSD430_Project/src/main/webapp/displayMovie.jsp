/* ******************************************************************
* Rachel Theis
* Module 5 Assignment
* CSD 430
* 6.22.25
* ******************************************************************
*/
<%@ page import="java.sql.*, database.MoviesDbBean" %>
<html>
<head><title>Rachel's Favorite Movies</title></head>
<body>

<%
    int id = Integer.parseInt(request.getParameter("movieId"));
    MoviesDbBean bean = new MoviesDbBean();
    ResultSet rs = bean.getMovieById(id);

    if (rs.next()) {
%>
    <h2>Movie Details</h2>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th><th>Name</th><th>Year</th><th>Genre</th><th>Director</th><th>IMDb</th><th>RT</th>
            </tr>
        </thead>
        <tr>
            <td><%= rs.getInt("id") %></td>
            <td><%= rs.getString("movie_name") %></td>
            <td><%= rs.getInt("year_released") %></td>
            <td><%= rs.getString("genre") %></td>
            <td><%= rs.getString("director") %></td>
            <td><%= rs.getBigDecimal("imdb_rating") %></td>
            <td><%= rs.getString("rt_ranking") %></td>
        </tr>
    </table>
<%
    } else {
        out.print("No record found.");
    }
    bean.close();
%>

</body>
</html>
