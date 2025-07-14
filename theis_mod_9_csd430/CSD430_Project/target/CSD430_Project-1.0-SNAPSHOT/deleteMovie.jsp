<%-- 
Rachel Theis
CSD 430
7.13.25
--%>

<%@ page import="java.sql.*, database.MoviesDbBean" %>
<html>
<head><title>Delete a Movie</title></head>
<body>
<h2>All Movies</h2>
<%
    MoviesDbBean bean = new MoviesDbBean();
    out.println(bean.readAll());
%>

<h2>Delete a Movie - Select ID of the movie you wish to delete.</h2>
<form method="post" action="deleteMovie.jsp">
    <label for="id">Select a Movie to Delete:</label>
    <select name="id" id="id">
        <%
            ResultSet rs = bean.getAllIds();
            boolean hasIds = false;
            while (rs.next()) {
                hasIds = true;
                int movieId = rs.getInt("id");
        %>
            <option value="<%= movieId %>"><%= movieId %></option>
        <%
            }
            rs.close();
        %>
    </select>
    <%
        if (hasIds) {
    %>
        <input type="submit" value="Delete Movie">
    <%
        } else {
            out.println("<p>No movies to delete.</p>");
        }
    %>
</form>

<%
    if ("POST".equalsIgnoreCase(request.getMethod()) && request.getParameter("id") != null) {
        try {
            int idToDelete = Integer.parseInt(request.getParameter("id"));
            bean.deleteMovie(idToDelete);
            out.println("<p style='color:green;'>Movie with ID " + idToDelete + " was deleted successfully.</p>");
        } catch (Exception e) {
            out.println("<p style='color:red;'>Error deleting movie: " + e.getMessage() + "</p>");
        }
    }

    out.println("<h2>Movies - Updated</h2>");
    out.println(bean.readAll());
    bean.close();
%>
</body>
</html>
