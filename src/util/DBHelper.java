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

    public static Vector<String[]> doQuery(String query) {
        Connection connection = getConnection();
        Statement statement = null;
        ResultSet resultSet = null;
        Vector<String[]> results = new Vector<String[]>();

        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);

            ResultSetMetaData md = resultSet.getMetaData();
            int numCols = md.getColumnCount();

            while (resultSet.next()) {
                String[] tmp = new String[numCols];
                for (int i = 0; i < numCols; i++) {
                    tmp[i] = resultSet.getString(i + 1);
                }
                results.add(tmp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return results;
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
        String url      = "jdbc:mysql://opatija.sdsu.edu:3306/jadrn048";
        String username = "jadrn048";
        String password = "outlet";
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
