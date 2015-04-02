package bean;

import util.DBHelper;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Category implements Serializable {

    private String name;

    public Category() {}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static ArrayList<Category> getCategories() {
        ResultSet resultSet = DBHelper.doQuery("SELECT categoryName FROM category");

        ArrayList<Category> categories = new ArrayList<Category>();
        try {
            while (resultSet.next()) {
                String categoryName = resultSet.getString("categoryName");
                Category category = new Category();
                category.setName(categoryName);
                categories.add(category);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }
}
