<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="mainContentSidebar" class="sidebar">
  <ul id="mainContentSidebarMenu">
    <%--Categories--%>
    <li class="ui-widget-header">Categories</li>
    <%--@elvariable id="categories" type="java.util.List"--%>
    <c:forEach var="category" items="${categories}">
      <li><a href=""><c:out value="${category.name}" /></a></li>
    </c:forEach>

    <%--Platforms--%>
    <li class="ui-widget-header">Platforms</li>
    <%--@elvariable id="platforms" type="java.util.List"--%>
    <c:forEach var="platform" items="${platforms}">
      <li><a href=""><c:out value="${platform.name}" /></a></li>
    </c:forEach>

    <%--Vendors--%>
    <li class="ui-widget-header">Vendors</li>
    <%--@elvariable id="vendors" type="java.util.List"--%>
    <c:forEach var="vendor" items="${vendors}">
      <li><a href=""><c:out value="${vendor.name}" /></a></li>
    </c:forEach>
  </ul>
</div>