<%-- 
Rachel Theis
CSD 430
7.13.25
--%>

<%@ page import="java.sql.*, database.MoviesDbBean" %>
<html>
<head><title>Delete Result</title></head>
<body>
<%
    String idParam = request.getParameter("movieId");
    if (idParam != null) {
        int id = Integer.parseInt(idParam);
        MoviesDbBean bean = new MoviesDbBean();
        bean.deleteMovie(id);
%>

<h2>Movie Deleted Successfully</h2>

<h2>Remaining Movie Records</h2>
<%
    out.print(bean.readAll());
%>

<h2>Delete Another Movie</h2>
<form action="deleteMovieResult.jsp" method="post">
    <select name="movieId">
        <%
            ResultSet rs = bean.getAllIds();
            while (rs != null && rs.next()) {
        %>
            <option value="<%= rs.getInt("id") %>"><%= rs.getInt("id") %></option>
        <%
            }
            bean.close();
        %>
    </select>
    <input type="submit" value="Delete Movie">
</form>

<%
    } else {
        out.print("<p>No movie selected.</p>");
    }
%>
</body>
</html>
