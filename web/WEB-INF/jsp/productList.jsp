<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.min.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.structure.min.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.theme.min.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/app.css"/>
  <title>Welcome</title>
</head>
<body>

<jsp:include page="shared/header.jsp" />

<div id="mainContentContainer">
  <jsp:include page="shared/sidebar.jsp" />
</div>

<%--&lt;%&ndash;@elvariable id="products" type="java.util.List"&ndash;%&gt;--%>
<%--<c:forEach var="product" items="${products}">--%>
  <%--<c:out value="${product.sku}" /> <br>--%>
  <%--<c:out value="${product.vendor}" /> <p>--%>
<%--</c:forEach>--%>

</body>
</html>
