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
  <title>Order Confirmation</title>
</head>
<body>
<jsp:include page="shared/header.jsp" />
<div class="mainContentContainer" style="padding-top: 3em;">
  <div class="orderConfirmationGraphic" style="width: 35%; float: left; text-align: right;">
    <img src="${pageContext.request.contextPath}/image/check-mark.png" alt="complete" style="max-width: 200px;"/>
  </div>
  <div class="orderConfirmationContainer" style="width: 60%; float: right; padding-left: 5%;">
    <h1>Thank you for your order</h1>
    <p>
      Order Number: AS235D
    </p>
    <p>
      Estimate shipping
    </p>
  </div>
</div>
</body>
</html>
