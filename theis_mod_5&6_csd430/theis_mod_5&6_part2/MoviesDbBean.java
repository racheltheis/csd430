/* ******************************************************************
* Rachel Theis
* Module 5 Assignment
* CSD 430
* 6.22.25
* ******************************************************************
*/
package database;

import java.sql.*;
import java.io.Serializable;

public class MoviesDbBean implements Serializable {

    private static final long serialVersionUID = 1L;
    private Connection connection;
    private Statement statement;

    public MoviesDbBean() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/CSD430";
            connection = DriverManager.getConnection(url, "student1", "pass");
            statement = connection.createStatement();
        } catch (Exception e) {
            System.out.println("Connection error: " + e);
        }
    }

    public ResultSet getAllIds() {
        try {
            return statement.executeQuery("SELECT id FROM data ORDER BY id ASC");
        } catch (SQLException e) {
            System.out.println("SQL error: " + e);
            return null;
        }
    }

    public ResultSet getMovieById(int id) {
        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM data WHERE id = ?");
            ps.setInt(1, id);
            return ps.executeQuery();
        } catch (SQLException e) {
            System.out.println("SQL error: " + e);
            return null;
        }
    }

    public void close() {
        try {
            statement.close();
            connection.close();
        } catch (SQLException e) {
            System.out.println("Close error: " + e);
        }
    }
}
