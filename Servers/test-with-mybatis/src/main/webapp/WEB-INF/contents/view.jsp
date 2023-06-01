<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<h2>Welcome Students</h2>
	
	<h3>Search ID Student</h3>
	<s:form action="id">
		<s:textfield name="id" label="id" />
		<s:submit value="Submit"/>	
	</s:form>
	
	
	<table>
		<thead>
			<tr>
				<th>name</th>
				<th>branch</th>
				<th>percentage</th>
				<th>phone</th>
				<th>email</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator var="student" value="students">
				<tr>
					<td>${student.getName()}</td>
					<td>${student.getBranch()}</td>
					<td>${student.getPercentage()}</td>
					<td>${student.getPhone()}</td>
					<td>${student.getEmail()}</td>
				<tr>
			</s:iterator>
		</tbody>
	</table>
</body>
</html>