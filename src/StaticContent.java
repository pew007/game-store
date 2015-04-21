import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/page")
public class StaticContent extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String content = request.getParameter("content");

        if (content.equals("about")) {
            request.getRequestDispatcher("/WEB-INF/jsp/about.jsp").forward(request, response);
        } else if (content.equals("contact")) {
            request.getRequestDispatcher("/WEB-INF/jsp/contact.jsp").forward(request, response);
        }
    }
}
