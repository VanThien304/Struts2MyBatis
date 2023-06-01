<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
<h2>${student.getId()}</h2>
	<s:form action="update">
		<h3>${student.getName()}</h3>
		<s:textfield name="name" label="name"/>
		
		<h3>${student.getBranch()}</h3>
		<s:textfield name="branch" label="branch"/>
		
		<h3>${student.getPercentage()}</h3>
		<s:textfield name="percentage" label="percentage"/>
		
		<h3>${student.getPhone()}</h3>
		<s:textfield name="phone" label="phone"/>
		
		<h3>${student.getEmail()}</h3>
		<s:textfield name="email" label="email"/>
		
		<s:submit value="submit"/>
	</s:form>
</body>
</html>