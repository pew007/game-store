import bean.BillingInfo;
import bean.ShippingInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/order/summary")
public class OrderSummary extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ShippingInfo shippingInfo = new ShippingInfo();
        shippingInfo.setFirstName(request.getParameter("shippingFirstName"));
        shippingInfo.setLastName(request.getParameter("shippingLastName"));
        shippingInfo.setAddressOne(request.getParameter("shippingAddress1"));
        shippingInfo.setAddressTwo(request.getParameter("shippingAddress2"));
        shippingInfo.setCity(request.getParameter("shippingCity"));
        shippingInfo.setState(request.getParameter("shippingState"));
        shippingInfo.setZip(request.getParameter("shippingZip"));
        shippingInfo.setPhoneNumber(request.getParameter("shippingPhone"));

        BillingInfo billingInfo = new BillingInfo();
        billingInfo.setFirstName(request.getParameter("billingFirstName"));
        billingInfo.setLastName(request.getParameter("billingLastName"));
        billingInfo.setAddressOne(request.getParameter("billingAddress1"));
        billingInfo.setAddressTwo(request.getParameter("billingAddress2"));
        billingInfo.setCity(request.getParameter("billingCity"));
        billingInfo.setState(request.getParameter("billingState"));
        billingInfo.setZip(request.getParameter("billingZip"));
        billingInfo.setPhoneNumber(request.getParameter("billingPhone"));
        billingInfo.setCardType(request.getParameter("paymentCardType"));
        billingInfo.setCardNumber(request.getParameter("paymentCardNumber"));
        billingInfo.setExpirationMonth(request.getParameter("paymentCardExpireMonth"));
        billingInfo.setExpirationYear(request.getParameter("paymentCardExpireYear"));
        billingInfo.setSecurityCode(request.getParameter("paymentCardCSV"));

        HttpSession session = request.getSession(false);
        session.setAttribute("shippingInfo", shippingInfo);
        session.setAttribute("billingInfo", billingInfo);

        request.getRequestDispatcher("/WEB-INF/jsp/orderSummary.jsp").forward(request, response);
    }
}
