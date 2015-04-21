<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="shared/assets.jsp" />
  <title>Cart Summary</title>
</head>
<body>
<jsp:include page="shared/header.jsp" />
<div class="mainContentContainer">
  <div class="orderSummaryContainer">
    <h1>Order Summary</h1>
    <div class="orderSummay">
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

    <div class="shippingAndBillingSummary">
      <div class="shippingInfo">
        <fieldset>
          <legend>Shipping Information</legend>
          <jsp:useBean id="shippingInfo" scope="session" type="bean.ShippingInfo"/>
          <ul class="noBullet">
            <li>
              <span class="left">Name:</span>
              <div class="right">${shippingInfo.firstName} ${shippingInfo.lastName}</div>
            </li>
            <li>
              <span class="left">Address:</span>
              <div class="right">
                ${shippingInfo.addressOne} ${shippingInfo.addressTwo} <br/>
                ${shippingInfo.city} <br/>
                ${shippingInfo.state} ${shippingInfo.zip}
              </div>
            </li>
            <li>
              <span class="left">Phone:</span>
              <div class="right">${shippingInfo.phoneNumber}</div>
            </li>
          </ul>
        </fieldset>
      </div>
      <div class="billingInfo">
        <fieldset>
          <legend>Billing Information</legend>
          <jsp:useBean id="billingInfo" scope="session" type="bean.BillingInfo"/>
          <ul class="noBullet">
            <li>
              <span class="left">Name:</span>
              <div class="right">${billingInfo.firstName} ${billingInfo.lastName}</div>
            </li>
            <li>
              <span class="left">Address:</span>
              <div class="right">
                ${billingInfo.addressOne} ${billingInfo.addressTwo} <br/>
                ${billingInfo.city} <br/>
                ${billingInfo.state} ${billingInfo.zip}
              </div>
            </li>
            <li>
              <span class="left">Card:</span>
              <div class="right">${billingInfo.maskedCardNumber}</div>
            </li>
            <li>
              <span class="left">Expiration:</span>
              <div class="right">${billingInfo.expirationMonth}/${billingInfo.expirationYear}</div>
            </li>

          </ul>
        </fieldset>
      </div>
    </div>
  </div>

  <div class="orderSummaryAction">
    <button class="editOrder">Edit Order</button>
    <button class="placeOrder">Place Order</button>
  </div>
</div>
</body>
</html>
