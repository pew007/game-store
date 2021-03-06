package bean;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.ArrayList;

public class ShoppingCart implements Serializable {

    private ArrayList<CartItem> cartItems;
    private float totalPrice;

    public ShoppingCart() {
        this.cartItems = new ArrayList<CartItem>();
    }

    public ArrayList<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(ArrayList<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public float getTotalPrice() {
        float total = 0;
        for (CartItem cartItem : this.cartItems) {
            total += cartItem.getTotalPrice();
        }
        return total;
    }

    public void setTotalPrice(float totalPrice) {
        for (CartItem cartItem : this.cartItems) {
            this.totalPrice += cartItem.getTotalPrice();
        }
    }

    public double getTax() {
        return 0.08 * (this.totalPrice + 5.00);
    }

    public double getGrandTotal() {
        return this.getTotalPrice() + this.getTax() + 5.00;
    }

    public void addCartItem(String sku, int quantity) {

        Product product = Product.getSingleProduct(sku);
        CartItem cartItem = new CartItem(product, quantity);

        int index = this.itemExistsInCart(cartItem);
        if (index >= 0) {
            CartItem itemToUpdate = this.cartItems.get(index);
            itemToUpdate.setQuantity(cartItem.getQuantity());
            this.cartItems.set(index, itemToUpdate);
        } else {
            this.cartItems.add(cartItem);
        }

        this.totalPrice += cartItem.getTotalPrice();
    }

    public int itemExistsInCart(CartItem cartItem) {

        String skuToCheck = cartItem.getProduct().getSku();

        if (this.cartItems.isEmpty()) {
            return -1;
        }

        for (int i = 0; i < this.cartItems.size(); i++) {
            String currentSku = this.cartItems.get(i).getProduct().getSku();
            if (currentSku.equals(skuToCheck)) {
                return i;
            }
        }

        return -1;
    }

    public boolean removeCartItem(String sku) {

        for (int i = 0; i < this.cartItems.size(); i++) {
            CartItem cartItem = this.cartItems.get(i);
            if (cartItem.getProduct().getSku().equals(sku)) {
                this.cartItems.remove(i);
                this.totalPrice -= cartItem.getTotalPrice();
                return true;
            }
        }

        return false;
    }

    public boolean updateCartItem(String sku, int quantity) {

        try {
            for (CartItem cartItem : this.cartItems) {
                if (cartItem.getProduct().getSku().equals(sku)) {
                    if (cartItem.getProduct().getQuantity() < quantity) {
                        return false;
                    } else {
                        this.totalPrice -= cartItem.getPrice() * cartItem.getQuantity();
                        this.totalPrice += cartItem.getPrice() * quantity;
                        cartItem.setQuantity(quantity);
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            return false;
        }

        return false;
    }

    public void checkout() throws Exception {
        for (CartItem cartItem : this.cartItems) {
            int quantity = cartItem.getQuantity();
            cartItem.getProduct().markAsSold(quantity);
        }
    }
}
