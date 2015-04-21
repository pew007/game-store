import bean.ShoppingCart;
import util.JsonBuilder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

@WebServlet("/item/remove")
public class RemoveCartItem extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sku = request.getParameter("sku");

        HttpSession session = request.getSession(false);
        ShoppingCart shoppingCart = (ShoppingCart) session.getAttribute("shoppingCart");

        boolean isItemRemoved = shoppingCart.removeCartItem(sku);

        HashMap<String, String> responseHash = new HashMap<String, String>();

        if (isItemRemoved) {
            responseHash.put("status", "OK");
        } else {
            responseHash.put("status", "Error");
        }

        String jsonResponse = JsonBuilder.toJson(responseHash);

        response.setContentType("application/json");
        PrintWriter output = response.getWriter();
        output.println(jsonResponse);
        output.close();
    }
}
