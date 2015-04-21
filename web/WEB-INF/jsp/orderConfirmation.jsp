<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="shared/assets.jsp" />
  <title>Order Confirmation</title>
</head>
<body>
<jsp:include page="shared/header.jsp" />
<div class="mainContentContainer" style="padding-top: 3em;">
  <div class="orderConfirmationTop">
    <div class="orderConfirmationGraphic" style="width: 35%; float: left; text-align: right;">
      <img src="${pageContext.request.contextPath}/image/checkmark.png" alt="complete" style="max-width: 200px;"/>
    </div>
    <div class="orderConfirmationContainer" style="width: 60%; float: right; padding-left: 5%;">
      <h1>Thank you for your order</h1>
      <jsp:useBean id="shippingInfo" scope="session" type="bean.ShippingInfo"/>
      <ul class="noBullet" style="padding: 0;">
        <li>
          <span class="left">Order Number:</span>
          <span class="right">AD35FG2</span>
        </li>
        <li>
          <span class="left">Shipping:</span>
          <span class="right">1-2 days</span>
        </li>
        <li>
          <span class="left">Shipping To:</span>
          <div class="right">${shippingInfo.firstName} ${shippingInfo.lastName}</div>
        </li>
        <li>
          <span class="left"></span>
          <div class="right">
            ${shippingInfo.addressOne} ${shippingInfo.addressTwo} <br/>
            ${shippingInfo.city} <br/>
            ${shippingInfo.state} ${shippingInfo.zip}
          </div>
        </li>

      </ul>
    </div>
  </div>

  <div class="orderConfirmationBottom">
    <table class="cartSummaryTable">
      <thead>
      <tr>
        <th>Product Description</th>
        <th>Quantity</th>
        <th>Unit Price</th>
        <th>Total Price</th>
      </tr>
      </thead>
      <tbody>
      <jsp:useBean id="shoppingCart" scope="session" type="bean.ShoppingCart"/>
      <c:forEach var="cartItem" items="${shoppingCart.cartItems}">
        <tr>
          <td>
            <a href="${pageContext.request.contextPath}/product/details?sku=${cartItem.product.sku}">${cartItem.product.vendorModel}</a>
          </td>
          <td>${cartItem.quantity}</td>
          <td><fmt:formatNumber type="CURRENCY">${cartItem.price}</fmt:formatNumber></td>
          <td><fmt:formatNumber type="CURRENCY">${cartItem.totalPrice}</fmt:formatNumber></td>
        </tr>
      </c:forEach>
      <tr>
        <td></td>
        <td></td>
        <td style="text-align: right;">Shipping:</td>
        <td>$5.00</td>
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td style="text-align: right;">Tax:</td>
        <td><fmt:formatNumber type="CURRENCY">${shoppingCart.tax}</fmt:formatNumber></td>
      </tr>
      <tr>
        <td></td>
        <td></td>
        <td style="text-align: right;">Sub-Total:</td>
        <td><fmt:formatNumber type="CURRENCY">${shoppingCart.grandTotal}</fmt:formatNumber></td>
      </tr>
      </tbody>
    </table>
  </div>
</div>

<%
  session.removeAttribute("shoppingCart");
%>
</body>
</html>
