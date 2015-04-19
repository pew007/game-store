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
  <title>Checkout</title>
</head>
<body>
<jsp:include page="shared/header.jsp" />
<div id="mainContentContainer">
  <h1>Checkout</h1>
  <div class="addressContainer">
    <div class="shippingInfoContainer">
      <h2>Shipping information</h2>
      <form action="">
        <ul class="noBullet">
          <li>
            <label for="shippingFirstName">First Name:</label>
            <span><input type="text" name="shippingFirstName" id="shippingFirstName"/></span>
          </li>

          <li>
            <label for="shippingLastName">Last Name:</label>
            <span><input type="text" name="shippingLastName" id="shippingLastName"/></span>
          </li>
        </ul>
      </form>
    </div>

    <div class="billingInfoContainer"></div>
  </div>

  <div class="paymentInfoContainer"></div>

</div>
</body>
</html>
