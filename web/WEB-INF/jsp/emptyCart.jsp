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
    <div class="cartSummary">
      <h2>Your cart is empty</h2>
    </div>
    <div class="cartSummaryAction">
      <button class="continueShopping">Continue Shopping</button>
    </div>
  </div>
</div>
</body>
</html>
