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
    <div id="sortBar">
      <ul>
        <li>SORT BY: </li>
        <li><a href="#" data-sortby="price-low">Lowest Price</a></li>
        <li><a href="#" data-sortby="price-high">Highest Price</a></li>
        <li><a href="#" data-sortby="name">Name</a></li>
        <li><a href="#" data-sortby="platform">Platform</a></li>
        <li></li>
      </ul>
    </div>
    <div id="productListContainer">
      <ul id="productList">
        <%--@elvariable id="products" type="java.util.List"--%>
        <c:forEach var="product" items="${products}">
          <li class="productItem" id="product-${product.sku}"
              data-name="${product.vendorModel}"
              data-price="${product.retail}"
              data-platform="${product.platform}">
            <div class="productItemInner">
              <div class="productImage">
                <img src="<c:out value="${product.image}" />" alt="<c:out value="${product.sku}" />"/>
              </div>
              <div class="productDetails">
                <h3><a href="#"><c:out value="${product.vendorModel}" /></a></h3>
                <p class="platform">for <strong><c:out value="${product.platform}" /></strong></p>
                <p class="vendor">by <c:out value="${product.vendor}" /></p>
                <p class="category"><c:out value="${product.category}" /></p>
                <p class="status">
                  <c:choose>
                    <c:when test="${product.status == 1}">In stock</c:when>
                    <c:when test="${product.status == 2}">More on the way</c:when>
                    <c:when test="${product.status == 3}">Coming soon</c:when>
                  </c:choose>
                </p>
              </div>
              <div class="productPrice">
                <div class="price">$<c:out value="${product.retail}" /></div>
                <button class="ui-button ui-button-text-only ui-widget ui-state-default ui-corner-all button">Add to cart</button>
              </div>
            </div>
          </li>
        </c:forEach>
      </ul>
    </div>
  </div>
</div>

</body>
</html>
