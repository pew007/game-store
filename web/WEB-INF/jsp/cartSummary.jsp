<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="shared/assets.jsp" />
  <title>Cart Summary</title>
</head>
<body>
<jsp:include page="shared/header.jsp" />
<div class="mainContentContainer">
  <div class="cartSummaryContainer">
    <h1>Cart Summary</h1>
    <jsp:useBean id="shoppingCart" scope="session" type="bean.ShoppingCart"/>
    <c:if test="${empty shoppingCart.cartItems}">
    <div class="cartSummary">
      <h2>Your cart is empty</h2>
    </div>
    <div class="cartSummaryAction">
      <button class="continueShopping">Continue Shopping</button>
    </div>
    </c:if>
    <c:if test="${not empty shoppingCart.cartItems}">
    <div class="cartSummary">
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
        <c:forEach var="cartItem" items="${shoppingCart.cartItems}">
          <tr class="cartItem" id="${cartItem.product.sku}">
            <td>
              <a href="${pageContext.request.contextPath}/product/details?sku=${cartItem.product.sku}">${cartItem.product.vendorModel}</a>
            </td>
            <td>
              <form id="editCartItemForm" action="${pageContext.request.contextPath}/cart/summary" method="POST" style="margin-bottom: 0;">
                <input type="hidden" name="sku" value="${cartItem.product.sku}"/>
                <input type="text" data-validate="required,maxVal(${cartItem.product.quantity})" class="cartItemQuantity" name="quantity" value="${cartItem.quantity}"/>
                <a href="#" class="updateCartItem">Update</a>
                <a href="#" class="removeCartItem">Remove</a>
              </form>
            </td>
            <td><fmt:formatNumber type="CURRENCY">${cartItem.price}</fmt:formatNumber></td>
            <td><fmt:formatNumber type="CURRENCY">${cartItem.totalPrice}</fmt:formatNumber></td>
          </tr>
        </c:forEach>
          <tr>
            <td></td>
            <td></td>
            <td style="text-align: right;">Sub-Total:</td>
            <td><fmt:formatNumber type="CURRENCY">${shoppingCart.totalPrice}</fmt:formatNumber></td>
          </tr>
        </tbody>
      </table>
    </div>

    <div class="cartSummaryAction">
      <button class="continueShopping">Continue Shopping</button>
      <button class="continueCheckout">Continue Checkout</button>
    </div>
    </c:if>
  </div>
</div>
</body>
</html>
