package bean;

import util.DBHelper;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

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
        this.image = "/_p_images/" + image;
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

    public void setStatus(int quantity) {
        if (quantity > 0) {
            this.status = IN_STOCK;
        } else if (quantity == 0) {
            this.status = MORE_ON_THE_WAY;
        } else {
            this.status = COMING_SOON;
        }
    }

    public static ArrayList<Product> getProducts() {
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
                ")");

        ArrayList<Product> products = new ArrayList<Product>();
        try {
            while (resultSet.next()) {
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

                Product product = new Product();
                product.setSku(sku);
                product.setVendor(vendor);
                product.setCategory(category);
                product.setPlatform(platform);
                product.setVendorModel(vendorModel);
                product.setDescription(description);
                product.setFeatures(features);
                product.setImage(image);
                product.setRetail(retail);
                product.setQuantity(quantity);
                product.setStatus(quantity);

                products.add(product);
            }
            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return products;
    }

    public String toJsonString() {
        String jsonString;

        String featureString = "";
        featureString += "[";
        for (Object feature : this.getFeatures()) {
            featureString += "\"" + feature.toString() + "\",";
        }
        featureString = featureString.substring(0, featureString.length() - 1);
        featureString += "]";

        jsonString = "{\"sku\":\"" + this.getSku() + "\""
                + ", \"vendor\":\"" + this.getVendor() + "\""
                + ", \"category\":\"" + this.getCategory() + "\""
                + ", \"platform\":\"" + this.getPlatform() + "\""
                + ", \"vendorModel\":\"" + this.getVendorModel() + "\""
                + ", \"description\":\"" + this.getDescription() + "\""
                + ", \"retail\":\"" + this.getRetail() + "\""
                + ", \"image\":\"" + this.getImage() + "\""
                + ", \"quantity\":\"" + this.getQuantity() + "\""
                + ", \"features\":" + featureString
                + "}";

        return jsonString;
    }
}
