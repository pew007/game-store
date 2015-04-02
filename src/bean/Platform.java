package bean;

import util.DBHelper;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Platform implements Serializable {

    private String name;

    public Platform() {}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static ArrayList<Platform> getPlatforms() {
        ResultSet resultSet = DBHelper.doQuery("SELECT platformName FROM platform");

        ArrayList<Platform> categories = new ArrayList<Platform>();
        try {
            while (resultSet.next()) {
                String platformName = resultSet.getString("platformName");
                Platform platform = new Platform();
                platform.setName(platformName);
                categories.add(platform);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }
}
