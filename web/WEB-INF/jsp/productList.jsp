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
  <div id="mainContentBody">
    <ul class="productList">
      <%--@elvariable id="products" type="java.util.List"--%>
      <c:forEach var="product" items="${products}">
        <li class="productItem" id="product-${product.sku}">
          <div class="productItemInner">
            <div class="productImage">
              <img src="<c:out value="${product.image}" />" alt="<c:out value="${product.sku}" />"/>
            </div>
          </div>
        </li>
      </c:forEach>
    </ul>
  </div>
</div>

</body>
</html>