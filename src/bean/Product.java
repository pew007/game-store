package bean;

import util.DBHelper;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

public class Product implements Serializable {

    public static final int IN_STOCK = 1;
    public static final int MORE_ON_THE_WAY = 2;
    public static final int COMING_SOON = 3;

    private String sku;
    private String vendor;
    private String category;
    private String platform;
    private String vendorModel;
    private String description;
    private ArrayList features;
    private float retail;
    private String image;
    private int quantity;
    private int status;

    public Product() {}

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public String getVendor() {
        return vendor;
    }

    public void setVendor(String vendor) {
        this.vendor = vendor;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getPlatform() {
        return platform;
    }

    public void setPlatform(String platform) {
        this.platform = platform;
    }

    public String getVendorModel() {
        return vendorModel;
    }

    public void setVendorModel(String vendorModel) {
        this.vendorModel = vendorModel;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ArrayList getFeatures() {
        return features;
    }

    public void setFeatures(String features) {
        this.features = new ArrayList<String>(Arrays.asList(features.split("\n")));
    }

    public float getRetail() {
        return retail;
    }

    public void setRetail(float retail) {
        this.retail = retail;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = "/~jadrn048/proj1/_p_images/" + image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int quantity) throws SQLException {
        if (!this.isOnHand()) {
            this.status = COMING_SOON;
        } else {
            if (quantity > 0) {
                this.status = IN_STOCK;
            } else if (quantity == 0) {
                this.status = MORE_ON_THE_WAY;
            }
        }
    }

    private boolean isOnHand() throws SQLException {
        ResultSet resultSet = DBHelper.doQuery("SELECT * FROM on_hand WHERE sku='" + this.sku + "'");
        return resultSet.next();
    }

    public static ArrayList<Product> getProducts(String filterType, String filterId, String search) {
        String query = "SELECT product.*, vendor.vendorName, category.categoryName, platform.platformName, on_hand.quantity\n" +
                        "FROM product\n" +
                        "LEFT JOIN (vendor, category, platform)\n" +
                        "ON (\n" +
                        "product.vendorID = vendor.vendorID\n" +
                        "AND\n" +
                        "product.categoryID = category.categoryID\n" +
                        "AND\n" +
                        "product.platformID = platform.platformID\n" +
                        ")\n" +
                        "LEFT JOIN (on_hand)\n" +
                        "ON (product.sku = on_hand.sku)";
        if (filterType != null && filterId != null) {
            query += "WHERE product." + filterType + "='" + filterId + "'";
        } else if (search != null) {
            query += "WHERE product.vendorModel LIKE '%" + search + "%'";
        }

        ResultSet resultSet = DBHelper.doQuery(query);

        ArrayList<Product> products = new ArrayList<Product>();
        try {
            while (resultSet.next()) {
                Product product = new Product();
                product.mapFromResultSet(resultSet);
                products.add(product);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    public static Product getSingleProduct(String s) {
        ResultSet resultSet = DBHelper.doQuery(
                "SELECT product.*, vendor.vendorName, category.categoryName, platform.platformName, on_hand.quantity\n" +
                "FROM product\n" +
                "LEFT JOIN (vendor, category, platform, on_hand)\n" +
                "ON (\n" +
                "\tproduct.vendorID = vendor.vendorID\n" +
                "\tAND\n" +
                "\tproduct.categoryID = category.categoryID\n" +
                "\tAND\n" +
                "\tproduct.platformID = platform.platformID\n" +
                "\tAND\n" +
                "\tproduct.sku = on_hand.sku\n" +
                ")\n" +
                "WHERE product.sku = '" + s + "'");

        Product product = new Product();
        try {
            while (resultSet.next()) {
                product.mapFromResultSet(resultSet);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return product;
    }

    private void mapFromResultSet(ResultSet resultSet) throws SQLException {

        String sku          = resultSet.getString("sku");
        String vendor       = resultSet.getString("vendorName");
        String category     = resultSet.getString("categoryName");
        String platform     = resultSet.getString("platformName");
        String vendorModel  = resultSet.getString("vendorModel");
        String description  = resultSet.getString("description");
        String features     = resultSet.getString("features");
        String image        = resultSet.getString("image");
        float retail        = resultSet.getFloat("retail");
        int quantity        = resultSet.getInt("quantity");

        this.setSku(sku);
        this.setVendor(vendor);
        this.setCategory(category);
        this.setPlatform(platform);
        this.setVendorModel(vendorModel);
        this.setDescription(description);
        this.setFeatures(features);
        this.setImage(image);
        this.setRetail(retail);
        this.setQuantity(quantity);
        this.setStatus(quantity);
    }

    public void markAsSold(int quantity) throws Exception {

        int newQuantity = this.quantity - quantity;

        DBHelper.doUpdate("UPDATE `on_hand` " +
                "SET quantity='" + newQuantity + "', " +
                "last_modified='" + this.getCurrentDateString() + "' " +
                "WHERE sku='" + this.getSku() + "'");

        if (productSent()) {
            updateSentProduct(quantity);
        } else {
            addSentProduct(quantity);
        }
    }

    private String getCurrentDateString() {
        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy/MM/dd");
        return dateFormatter.format(new Date());
    }

    private boolean productSent() throws Exception {
        ResultSet result = DBHelper
                .doQuery("SELECT * FROM `merchandise_out` WHERE sku='" + this.getSku() + "'");
        return result.next();
    }

    private void updateSentProduct(int quantity) throws Exception {
        DBHelper.doUpdate("UPDATE `merchandise_out` " +
                "SET date='" + this.getCurrentDateString() + "', " +
                "quantity='" + quantity + "' " +
                "WHERE sku='" + this.getSku() + "'");
    }

    private void addSentProduct(int quantity) throws Exception {
        DBHelper.doUpdate("INSERT INTO `merchandise_out` VALUES ('"
                + this.getSku() + "', '"
                + this.getCurrentDateString() + "', '"
                + quantity + "')");
    }
}
