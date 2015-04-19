package bean;

import java.io.Serializable;
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
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void addCartItem(CartItem cartItem) {

        int index = this.itemExistsInCart(cartItem);
        if ( index >= 0) {
            CartItem itemToUpdate = this.cartItems.get(index);
            itemToUpdate.setQuantity(itemToUpdate.getQuantity() + cartItem.getQuantity());
            this.cartItems.set(index, itemToUpdate);
        } else {
            this.cartItems.add(cartItem);
        }

        this.totalPrice += cartItem.getPrice();
    }

    public int itemExistsInCart(CartItem cartItem) {

        String skuToCheck = cartItem.getProduct().getSku();

        for (int i = 0; i < this.cartItems.size(); i++) {
            String currentSku = this.cartItems.get(i).getProduct().getSku();
            if (currentSku.equals(skuToCheck)) {
                return i;
            }
        }

        return -1;
    }
}
