<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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

<div class="mainContentContainer">
  <jsp:include page="shared/sidebar.jsp" />
  <div class="mainContentBody">
    <jsp:include page="shared/searchbar.jsp" />
    <div class="productListContainer">
      <div class="productContainer">
        <div class="productItem">
          <div class="productItemInner">
            <div class="productDetailsTop">
              <%--@elvariable id="product" type="bean.Product"--%>
              <div class="productImage">
                <img src=${product.image} alt=${product.sku} />
              </div>
              <div class="productDetails">
                <h1>${product.vendorModel}</h1>
                <h5>${product.vendor} ${product.category}</h5>
                <h5>${product.platform}</h5>
                <c:choose>
                  <c:when test="${product.status == 1}">
                    <div class="price">
                      <h1><fmt:formatNumber type="CURRENCY">${product.retail}</fmt:formatNumber></h1>
                      <form action="${pageContext.request.contextPath}/cart/summary" method="POST">
                      <div>
                        <input type="hidden" name="sku" value="${product.sku}"/>
                        <span>Quantity:</span>
                        <select name="quantity" id="quantity" style="margin-bottom: 5px;">
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                        </select>
                      </div>
                      <button class="ui-button ui-button-text-only ui-widget ui-state-default ui-corner-all button">Add to cart</button>
                      </form>
                    </div>
                  </c:when>
                  <c:when test="${product.status == 2}">
                    <h3 class="warning">This product is currently out of stock but there is more on the way!</h3>
                  </c:when>
                  <c:when test="${product.status == 3}">
                    <h3 class="warning">Coming soon</h3>
                  </c:when>
                </c:choose>
              </div>
            </div>
            <div class="productDetailsBottom">
              <div class="productDescription">
                <h1>Description:</h1>
                <p>${product.description}</p>
              </div>
              <div class="productFeatures">
                <h1>Features:</h1>
                <ul>
                <c:forEach var="feature" items="${product.features}">
                  <li>${feature}</li>
                </c:forEach>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>
