<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login Page</title>
</head>
<body>


	<s:if test="currentPage > 1">
		<a href="<s:url value='%{first}'/>">First</a>
		<a href="<s:url value='%{prev}'/>">Prev</a>
	</s:if>
	<s:if test="currentPage < totalPages">
		<a href="<s:url value='%{next}'/>">Next</a>
		<a href="<s:url value='%{last}'/>">Last</a>
	</s:if>
	<h1>User List</h1>
	<a href="pagination.action">ádasd</a>
	<s:url var="first" action="pagination">
		<s:param name="currentPage">1</s:param>
	</s:url>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Username</th>
				<th>Password</th>
				<th>Email</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="users">
				<tr>
					<td><s:property value="id" /></td>
					<td><s:property value="username" /></td>
					<td><s:property value="password" /></td>
					<td><s:property value="email" /></td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	<div>
		<s:url var="first" action="pagination">
			<s:param name="currentPage">1</s:param>
		</s:url>
		<s:url var="prev" action="pagination">
			<s:param name="currentPage">
				<s:property value="currentPage - 1" />
			</s:param>
		</s:url>
		<s:url var="next" action="pagination">
			<s:param name="currentPage">
				<s:property value="currentPage + 1" />
			</s:param>
		</s:url>
		<s:url var="last" action="pagination">
			<s:param name="currentPage">
				<s:property value="totalPages" />
			</s:param>
		</s:url>
		<s:if test="currentPage > 1">
			<a href="<s:url value="%{first}"/>">First</a>
			<a href="<s:url value="%{prev}"/>">Prev</a>
		</s:if>
		<s:if test="currentPage < totalPages">
			<a href="<s:url value="%{next}"/>">Next</a>
			<a href="<s:url value="%{last}"/>">Last</a>
		</s:if>
	</div>

</body>
</html>