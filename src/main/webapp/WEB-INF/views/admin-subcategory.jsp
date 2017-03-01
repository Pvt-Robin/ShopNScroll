<!-- HEADER -->
<%@ include file="component-header.jsp" %>
<div class="body-content">


<h1>Sub-Category Management</h1>
<form:form action="addsubcategory" modelAttribute="subCategory">
<form:input path="subCategoryId" hidden="true"/>
<form:input path="subCategoryName"/>
<form:input path="subCategoryDescription"/>
<form:select path="category" items="${categoryList}" itemLabel="categoryName" itemValue="categoryId" />
<form:button>${btnLabel}</form:button>
<c:if test="${btnLabel eq 'Update'}">

<form action="subcategory"><input type="submit" value="Cancel" /></form>
</c:if>
</form:form>
<br/>

<table class="table">
<tr>
<th>Unique Id</th>
<th>Name</th>
<th>Description</th>
<th>Category</th>
<th>Operation</th>
</tr>
<c:forEach var="slist" items="${subCategoryList}">
<tr>
<td>${slist.subCategoryId}</td>
<td>${slist.subCategoryName}</td>
<td>${slist.subCategoryDescription}</td>
<td>${slist.category.categoryName}</td>
<td>
<a href="updatesubcategory-${slist.subCategoryId}"><button>Update</button></a>
<a href="removesubcategory-${slist.subCategoryId}"><button>Delete</button></a>
</td>
</tr>
</c:forEach>
</table>


</div>
<!-- FOOTER -->
<%@ include file="component-footer.jsp" %>