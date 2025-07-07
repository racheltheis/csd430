<%--
* Rachel Theis
* Module 6 Assignment
* CSD 430
* 6.29.25
--%>

<%@ page import="java.sql.*, database.MoviesDbBean" %>
<html>
<head><title>Select Movie</title></head>
<body>

<h2>Select a Movie ID</h2>

<form method="post" action="displayMovie.jsp">
    <select name="movieId">
        <%
            MoviesDbBean bean = new MoviesDbBean();
            ResultSet rs = bean.getAllIds();
            while (rs.next()) {
        %>
            <option value="<%= rs.getInt("id") %>"><%= rs.getInt("id") %></option>
        <%
            }
            bean.close();
        %>
    </select>
    <input type="submit" value="View Movie">
</form>

</body>
</html>




