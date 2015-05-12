import bean.ShoppingCart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/order/confirmation")
public class OrderConfirmation extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");

        if (shoppingCart == null) {
            request.getRequestDispatcher("/WEB-INF/jsp/emptyCart.jsp").forward(request, response);
            return;
        }

        try {
            shoppingCart.checkout();
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }

        request.getRequestDispatcher("/WEB-INF/jsp/orderConfirmation.jsp").forward(request, response);
    }
}
