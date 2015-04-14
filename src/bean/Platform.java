package bean;

import util.DBHelper;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Platform implements Serializable {

    private int id;
    private String name;

    public Platform() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static ArrayList<Platform> getPlatforms() {
        ResultSet resultSet = DBHelper.doQuery("SELECT * FROM platform");

        ArrayList<Platform> categories = new ArrayList<Platform>();
        try {
            while (resultSet.next()) {
                int id = resultSet.getInt("platformID");
                String name = resultSet.getString("platformName");
                Platform platform = new Platform();
                platform.setId(id);
                platform.setName(name);
                categories.add(platform);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }
}
