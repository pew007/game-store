<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <title>Games 101</title>
</head>
<body>
<jsp:include page="shared/header.jsp" />

<div id="#mainContentContainer">
  <jsp:include page="shared/sidebar.jsp" />
  <div id="mainContentBody">
    <jsp:include page="shared/searchbar.jsp" />
    <div id="productListContainer">
      <div id="productContainer">
        <div class="productItem">
          <div class="productItemInner">
            <%--@elvariable id="product" type="bean.Product"--%>
            <div class="productImage">
              <img src="<c:out value="${product.image}" />" alt="<c:out value="${product.sku}" />" />
            </div>
            <div class="productDetails">
              <h1><c:out value="${product.vendorModel}"/></h1>
              <h4><c:out value="${product.vendor}"/></h4>
              <h4><c:out value="${product.category}"/></h4>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>
