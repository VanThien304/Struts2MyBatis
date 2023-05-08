<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
</head>
<body>
	<s:form action="login">
		<s:textfield name="name" label="Name" />
		<s:textfield name="password" label="Password" />
		<s:submit value="submit" />
	</s:form>
	
	
	<h2>${name }</h2>
</body>
</html>