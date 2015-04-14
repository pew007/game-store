package bean;

import util.DBHelper;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Category implements Serializable {

    private int id;
    private String name;

    public Category() {}

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

    public static ArrayList<Category> getCategories() {
        ResultSet resultSet = DBHelper.doQuery("SELECT * FROM category");

        ArrayList<Category> categories = new ArrayList<Category>();
        try {
            while (resultSet.next()) {
                String name = resultSet.getString("categoryName");
                int id = resultSet.getInt("categoryID");
                Category category = new Category();
                category.setName(name);
                category.setId(id);
                categories.add(category);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return categories;
    }
}
