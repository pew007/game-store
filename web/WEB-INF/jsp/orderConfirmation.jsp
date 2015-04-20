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
<div class="mainContentContainer">
  <div class="orderConfirmationContainer">
    <h1>Thank you for your order</h1>
  </div>
</div>
</body>
</html>
