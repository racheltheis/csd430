// Rachel Theis
//Module 8 Assignment
//CSD 430
//7.6.25


package database;

import java.io.Serializable;
import java.sql.*;

public class MoviesDbBean implements Serializable {

    private static final long serialVersionUID = 1L;

    private Connection connection;
    private Statement statement;

    public MoviesDbBean() {
        try {
            connect();
        } catch (Exception e) {
            System.out.println("Error! Error in constructor: " + e.getMessage());
        }
    }

    private void connect() throws ClassNotFoundException, SQLException {
        if (connection == null || connection.isClosed()) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/CSD430?useSSL=false";
            connection = DriverManager.getConnection(url, "student1", "pass");
            statement = connection.createStatement();
        }
    }

    public String readAll() {
        StringBuilder sb = new StringBuilder();
        ResultSet rs = null;

        try {
            connect();
            rs = statement.executeQuery("SELECT * FROM rachel_movies_data");

            sb.append("<table border='1'>");
            sb.append("<thead><tr>")
              .append("<th>ID</th><th>Title</th><th>Year</th><th>Genre</th>")
              .append("<th>Director</th><th>Rating</th></tr></thead><tbody>");

            while (rs.next()) {
                sb.append("<tr>")
                  .append("<td>").append(rs.getInt("id")).append("</td>")
                  .append("<td>").append(rs.getString("title")).append("</td>")
                  .append("<td>").append(rs.getInt("year_released")).append("</td>")
                  .append("<td>").append(rs.getString("genre")).append("</td>")
                  .append("<td>").append(rs.getString("director")).append("</td>")
                  .append("<td>").append(rs.getDouble("rating")).append("</td>")
                  .append("</tr>");
            }
            sb.append("</tbody></table>");

        } catch (Exception e) {
            sb.append("Error! Couold not display records: ").append(e.getMessage());
        }

        return sb.toString();
    }

    public ResultSet getAllIds() {
        try {
            connect();
            return statement.executeQuery("SELECT id FROM rachel_movies_data ORDER BY id ASC");
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println("Error! Could not fetch movie ids: " + e.getMessage());
            return null;
        }
    }

    public ResultSet getAllMovies() {
        ResultSet rs = null;
        try {
            connect();
            String query = "SELECT * FROM rachel_movies_data";
            rs = statement.executeQuery(query);
        } catch (Exception e) {
            System.out.println("Error! Could not retrieve all movies: " + e.getMessage());
        }
        return rs;
    }

    public ResultSet getMovieById(int id) {
        ResultSet rs = null;
        try {
            connect();
            String sql = "SELECT * FROM rachel_movies_data WHERE id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
        } catch (Exception e) {
            System.out.println("Error! Could not retriev movie: " + e.getMessage());
        }
        return rs;
    }

    public void addMovie(String title, int year_released, String genre, String director, double rating) {
        try {
            connect();
            String sql = "INSERT INTO rachel_movies_data (title, year_released, genre, director, rating) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setInt(2, year_released);
            ps.setString(3, genre);
            ps.setString(4, director);
            ps.setDouble(5, rating);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error! Could not add movie: " + e.getMessage());
        }
    }

    public void updateMovie(int id, String title, int year, String genre, String director, double rating) {
        try {
            connect();
            String sql = "UPDATE rachel_movies_data SET title=?, year_released=?, genre=?, director=?, rating=? WHERE id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, title);
            ps.setInt(2, year);
            ps.setString(3, genre);
            ps.setString(4, director);
            ps.setDouble(5, rating);
            ps.setInt(6, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error! Could not update movie: " + e.getMessage());
        }
    }

    public void deleteMovie(int id) {
        try {
            connect();
            String query = "DELETE FROM rachel_movies_data WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error! Could not delete movie: " + e.getMessage());
        }
    }

    public void close() {
        try {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            System.out.println("Error! Could not close DB: " + e.getMessage());
        }
    }
}
