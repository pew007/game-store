package model;

import util.DBHelper;

import java.io.Serializable;
import java.util.Vector;

public class ProductBean implements Serializable {

    private String sku;

    public ProductBean() {}

    public String getSku() {
        return sku;
    }

    public void setSku(String sku) {
        this.sku = sku;
    }

    public static ProductBean[] getProducts() {
        ProductBean[] products = new ProductBean[]{};

        Vector<String[]> results = DBHelper.doQuery("SELECT * FROM product");
        if (!results.isEmpty()) {
            for (int i = 0; i < results.size(); i++) {
                String sku = results.elementAt(0)[0];

                ProductBean product = new ProductBean();
                product.setSku(sku);
            }
        }

        return products;
    }
}
