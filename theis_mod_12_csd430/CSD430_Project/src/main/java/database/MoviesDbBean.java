/* ******************************************************************
* Rachel Theis
* Module 7 Assignment
* CSD 430
* 6.29.25
* ******************************************************************
*/
package database;

import java.io.Serializable;
import java.sql.*;

public class MoviesDbBean implements Serializable {

    private static final long serialVersionUID = 1L;

    private Connection connection;
    private Statement statement;

    public MoviesDbBean() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/CSD430?useSSL=false";
            connection = DriverManager.getConnection(url, "student1", "pass");
            statement = connection.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Connection error: " + e.getMessage());
        }
    }
    public String readAll() {
    StringBuilder dataStringBuilder = new StringBuilder();    
    ResultSet resultSet = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/CSD430?user=student1&password=pass";
        connection = DriverManager.getConnection(url);
        statement = connection.createStatement();
    } catch (Exception e) {
        dataStringBuilder.append("Connection error: ").append(e.getMessage());
        return dataStringBuilder.toString();
    }

    try {
        resultSet = statement.executeQuery("SELECT * FROM rachel_movies_data");

        dataStringBuilder.append("<table border='1'>");
        dataStringBuilder.append("<thead><tr><th>ID</th><th>Movie Name</th><th>Year</th><th>Genre</th><th>Director</th><th>IMDb</th></tr></thead>");
        dataStringBuilder.append("<tbody>");
        while (resultSet.next()) {
            dataStringBuilder.append("<tr>");
            dataStringBuilder.append("<td>").append(resultSet.getInt("movie_key")).append("</td>");
            dataStringBuilder.append("<td>").append(resultSet.getString("movie_name")).append("</td>");
            dataStringBuilder.append("<td>").append(resultSet.getInt("year_released")).append("</td>");
            dataStringBuilder.append("<td>").append(resultSet.getString("genre")).append("</td>");
            dataStringBuilder.append("<td>").append(resultSet.getString("director")).append("</td>");
            dataStringBuilder.append("<td>").append(resultSet.getDouble("imdb_rating")).append("</td>");
            dataStringBuilder.append("</tr>");
        }
        dataStringBuilder.append("</tbody></table>");
    } catch (SQLException e) {
        dataStringBuilder.append("Query error: ").append(e.getMessage());
    }

    return dataStringBuilder.toString();
}

    public ResultSet getAllIds() {
        try {
            return statement.executeQuery("SELECT movie_key FROM data ORDER BY movie_key ASC");
        } catch (SQLException e) {
            System.out.println("Error! Could not fetch IDs: " + e.getMessage());
            return null;
        }
    }

    public ResultSet getMovieById(int movieId) {
        try {
            String query = "SELECT * FROM data WHERE movie_key = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, movieId);
            return ps.executeQuery();
        } catch (SQLException e) {
            System.out.println("Error! Could not fetch: " + e.getMessage());
            return null;
        }
    }

    public void addMovie(String name, int year, String genre, String director, double imdbRating) {
        try {
            String query = "INSERT INTO data (movie_name, year_released, genre, director, imdb_rating) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setInt(2, year);
            ps.setString(3, genre);
            ps.setString(4, director);
            ps.setDouble(5, imdbRating);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error! Could not add: " + e.getMessage());
        }
    }

    public ResultSet getAllMovies() {
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        System.out.println("Sucess! Driver Loaded.");
        
        String url = "jdbc:mysql://localhost:3306/CSD430";
        connection = DriverManager.getConnection(url, "student1", "pass");
        System.out.println("Success! Connected to Databse");
        
        statement = connection.createStatement();
        rs = statement.executeQuery("SELECT * FROM data");
        System.out.println("Query Executed");
        
    } catch (Exception e) {
        e.printStackTrace();
    }
    return rs;
}






    public void deleteMovie(int movieId) {
        try {
            String query = "DELETE FROM data WHERE movie_key = ?";
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, movieId);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error deleting movie: " + e.getMessage());
        }
    }

    public void close() {
        try {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            System.out.println("Error closing connection: " + e.getMessage());
        }
    }
}
