package bean;

import util.DBHelper;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Vendor implements Serializable {

    private int id;
    private String name;

    public Vendor() {}

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

    public static ArrayList<Vendor> getVendors() {
        ResultSet resultSet = DBHelper.doQuery("SELECT * FROM vendor");

        ArrayList<Vendor> vendors = new ArrayList<Vendor>();
        try {
            while (resultSet.next()) {
                int id = resultSet.getInt("vendorID");
                String name = resultSet.getString("vendorName");
                Vendor vendor = new Vendor();
                vendor.setId(id);
                vendor.setName(name);
                vendors.add(vendor);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vendors;
    }
}
