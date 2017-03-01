<!-- HEADER -->
<%@ include file="component-header.jsp" %>


<h1>Products Management</h1>
<form:form action="addcategory" modelAttribute="category">
<form:input path="categoryId" hidden="true"/>
<form:input path="categoryName"/>
<form:input path="categoryDescription"/>
<form:button>${btnLabel}</form:button>
<c:if test="${btnLabel eq 'Update'}">
<form action="category"><input type="submit" value="Back" /></form>
</c:if>
</form:form>
<br/>

<table class="table">
<tr>
<th>Unique Id</th>
<th>Name</th>
<th>Description</th>
<th>Operation</th>
</tr>
<c:forEach var="clist" items="${categoryList}">
<tr>
<td>${clist.categoryId}</td>
<td>${clist.categoryName}</td>
<td>${clist.categoryDescription}</td>
<td>
<a href="updatecategory-${clist.categoryId}"><button>Update</button></a>
<a href="removecategory-${clist.categoryId}"><button>Delete</button></a>
</td>
</tr>
</c:forEach>
</table>

<!-- FOOTER -->
<%@ include file="component-footer.jsp" %>