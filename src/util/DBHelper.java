package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Vector;

public class DBHelper implements java.io.Serializable {

    private static final long serialVersionUID  = 1L;

    public static ResultSet doQuery(String query) {
        Connection connection = getConnection();
        ResultSet resultSet = null;

        try {
            Statement statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultSet;
    }

    public static int doUpdate(String query) {
        Connection connection = getConnection();
        Statement statement = null;
        int result = -1;

        try {
            statement = connection.createStatement();
            result = statement.executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    private static Connection getConnection() {

        String url      = "jdbc:mysql://localhost:3306/jadrn048"; // opatija
        String username = "root"; // jadrn048
        String password = ""; // outlet
        String driver   = "com.mysql.jdbc.Driver";

        Connection connection = null;
        try {
            Class.forName(driver).newInstance();
            connection = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return connection;
    }
}
