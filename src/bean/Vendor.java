package bean;

import util.DBHelper;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Vendor implements Serializable {

    private String name;

    public Vendor() {}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public static ArrayList<Vendor> getVendors() {
        ResultSet resultSet = DBHelper.doQuery("SELECT vendorName FROM vendor");

        ArrayList<Vendor> vendors = new ArrayList<>();
        try {
            while (resultSet.next()) {
                String vendorName = resultSet.getString("vendorName");
                Vendor vendor = new Vendor();
                vendor.setName(vendorName);
                vendors.add(vendor);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return vendors;
    }
}
