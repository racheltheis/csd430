<%-- 
Rachel Theis
Module 8 Assignment
CSD 420
7.6.25
--%>

<%@ page import="java.sql.*, database.MoviesDbBean" %>
<html>
<head><title>Select Movie to Update</title></head>
<body>
    <h2>Select a Movie to Update</h2>
    <form method="get" action="updateForm.jsp">
        <select name="movieId">
            <%
                MoviesDbBean bean = new MoviesDbBean();
                ResultSet rs = bean.getAllMovies();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String title = rs.getString("title");
            %>
                <option value="<%= id %>"><%= title %></option>
            <%
                }
                bean.close();
            %>
        </select>
        <input type="submit" value="Edit Movie">
    </form>
</body>
</html>
