<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.min.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.structure.min.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.theme.min.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/app.css"/>
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
      <button><a href="${pageContext.request.contextPath}/product/list">Continue Shopping</a></button>
    </div>
    </c:if>
    <c:if test="${not empty shoppingCart.cartItems}">
    <div class="cartSummary">
      <table class="cartSummaryTable">
        <thead>
          <tr>
            <th>Product Description</th>
            <th>Quantity</th>
            <th>Price</th>
          </tr>
        </thead>
        <tbody>
        <c:forEach var="cartItem" items="${shoppingCart.cartItems}">
          <tr>
            <td>
              <a href="${pageContext.request.contextPath}/product/details?sku=${cartItem.product.sku}">${cartItem.product.vendorModel}</a>
            </td>
            <td>
              <input type="text" class="cartItemQuantity" name="quantity" value="${cartItem.quantity}"/>
              <a href="#">Update</a>
              <a href="#">Remove</a>
            </td>
            <td><fmt:formatNumber type="CURRENCY">${cartItem.product.retail}</fmt:formatNumber></td>
          </tr>
        </c:forEach>
          <tr>
            <td></td>
            <td style="text-align: right;">Sub-Total:</td>
            <td><fmt:formatNumber type="CURRENCY">${shoppingCart.totalPrice}</fmt:formatNumber></td>
          </tr>
        </tbody>
      </table>
    </div>

    <div class="cartSummaryAction">
      <button><a href="${pageContext.request.contextPath}/product/list">Continue Shopping</a></button>
      <button><a href="${pageContext.request.contextPath}/billing/info">Continue Checkout</a></button>
    </div>
    </c:if>
  </div>
</div>
</body>
</html>
