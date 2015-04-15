<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="mainContentSidebar" class="sidebar">
  <ul id="mainContentSidebarMenu">
    <%--Categories--%>
    <li class="ui-widget-header">Categories</li>
    <%--@elvariable id="categories" type="java.util.List"--%>
    <c:forEach var="category" items="${categories}">
      <li>
        <form action="${pageContext.request.contextPath}/product/list">
          <input type="hidden" name="searchType" value="categoryID"/>
          <input type="hidden" name="searchId" value="<c:out value="${category.id}" />"/>
          <c:out value="${category.name}" />
        </form>
      </li>
    </c:forEach>

    <%--Platforms--%>
    <li class="ui-widget-header">Platforms</li>
    <%--@elvariable id="platforms" type="java.util.List"--%>
    <c:forEach var="platform" items="${platforms}">
      <li>
        <form action="${pageContext.request.contextPath}/product/list">
          <input type="hidden" name="searchType" value="platformID"/>
          <input type="hidden" name="searchId" value="<c:out value="${platform.id}" />"/>
          <c:out value="${platform.name}" />
        </form>
      </li>
    </c:forEach>

    <%--Vendors--%>
    <li class="ui-widget-header">Vendors</li>
    <%--@elvariable id="vendors" type="java.util.List"--%>
    <c:forEach var="vendor" items="${vendors}">
      <li>
        <form action="${pageContext.request.contextPath}/product/list">
          <input type="hidden" name="searchType" value="vendorID"/>
          <input type="hidden" name="searchId" value="<c:out value="${vendor.id}" />"/>
          <c:out value="${vendor.name}" />
        </form>
      </li>
    </c:forEach>
  </ul>
</div>
