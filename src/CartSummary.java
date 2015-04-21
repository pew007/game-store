import bean.ShoppingCart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cart/summary")
public class CartSummary extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int quantity = 0;
        String sku = request.getParameter("sku");
        String quantityString = request.getParameter("quantity");

        HttpSession session = request.getSession(false);
        ShoppingCart shoppingCart = (ShoppingCart)session.getAttribute("shoppingCart");

        if (shoppingCart == null) {
            shoppingCart = new ShoppingCart();
            session.setAttribute("shoppingCart", shoppingCart);
        }

        if (sku == null && quantityString == null) {
            request.getRequestDispatcher("/WEB-INF/jsp/cartSummary.jsp").forward(request, response);
            return;
        }

        if (quantityString != null) {
            quantity = Integer.parseInt(quantityString);
        }

        shoppingCart.addCartItem(sku, quantity);

        session.setAttribute("shoppingCart", shoppingCart);

        request.getRequestDispatcher("/WEB-INF/jsp/cartSummary.jsp").forward(request, response);
    }
}
