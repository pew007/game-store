<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
  <jsp:include page="shared/assets.jsp" />
  <title>Games 101</title>
</head>
<body>
<jsp:include page="shared/header.jsp" />
<div class="mainContentContainer">
  <jsp:include page="shared/sidebar.jsp" />
  <div class="mainContentBody">
    <jsp:include page="shared/searchbar.jsp" />
    <div class="sortBar">
      <ul>
        <li>SORT BY: </li>
        <li><a href="#" data-sortby="price-low">Lowest Price</a></li>
        <li><a href="#" data-sortby="price-high">Highest Price</a></li>
        <li><a href="#" data-sortby="name">Name</a></li>
        <li><a href="#" data-sortby="platform">Platform</a></li>
        <li><a href="#" data-sortby="avail">Availability</a></li>
        <li></li>
      </ul>
    </div>
    <%--@elvariable id="products" type="java.util.List"--%>
    <div class="productListContainer">
      <c:if test="${empty products}">
        <div class="productList emptyProductList">
          <h1>No products matching your search</h1>
        </div>
      </c:if>

      <c:if test="${not empty products}">
      <ul class="productList">
        <c:forEach var="product" items="${products}">
          <li class="productItem" id="product-${product.sku}"
              data-name="${product.vendorModel}"
              data-price="${product.retail}"
              data-platform="${product.platform}"
              data-status="${product.status}">
            <div class="productItemInner">
              <div class="productImage">
                <a href="${pageContext.request.contextPath}/product/details?sku=${product.sku}">
                  <img src="<c:out value="${product.image}" />" alt="<c:out value="${product.sku}" />"/>
                </a>
              </div>
              <div class="productDetails">
                <h3>
                  <a href="${pageContext.request.contextPath}/product/details?sku=${product.sku}"><c:out value="${product.vendorModel}" /></a>
                </h3>
                <p class="platform">for <strong><c:out value="${product.platform}" /></strong></p>
                <p class="vendor">by <c:out value="${product.vendor}" /></p>
                <p class="category"><c:out value="${product.category}" /></p>
              </div>
              <div class="productPrice">
                <div class="price">$<c:out value="${product.retail}" /></div>
                <div class="status">
                  <c:choose>
                    <c:when test="${product.status == 1}">
                      <form action="${pageContext.request.contextPath}/cart/summary" method="POST">
                        <input type="hidden" name="sku" value="${product.sku}"/>
                        <div style="margin-top: 0.5em;">
                        <span>Quantity:</span>
                        <select name="quantity" id="quantity" style="margin-bottom: 5px;">
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                        </select>
                        </div>
                        <button class="ui-button ui-button-text-only ui-widget ui-state-default ui-corner-all button" style="font-size: 1em;">Add to cart</button>
                      </form>
                    </c:when>
                    <c:when test="${product.status == 2}">
                      <h3 class="warning">More on the way</h3>
                    </c:when>
                    <c:when test="${product.status == 3}">
                      <h3 class="warning">Coming soon</h3>
                    </c:when>
                  </c:choose>
                </div>
              </div>
            </div>
          </li>
        </c:forEach>
        </c:if>
      </ul>
    </div>
  </div>
</div>
</body>

</html>
