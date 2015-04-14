import bean.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/product/list")
public class GetProductList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String searchType = request.getParameter("searchType");
        String searchId = request.getParameter("searchId");

        ArrayList<Vendor> vendors = Vendor.getVendors();
        ArrayList<Category> categories = Category.getCategories();
        ArrayList<Platform> platforms = Platform.getPlatforms();
        ArrayList<Product> allProducts = Product.getProducts(searchType, searchId);

        HttpSession session = request.getSession(true);
        session.setAttribute("products", allProducts);
        session.setAttribute("vendors", vendors);
        session.setAttribute("categories", categories);
        session.setAttribute("platforms", platforms);

        request.getRequestDispatcher("/WEB-INF/jsp/productList.jsp").forward(request, response);
    }
}
