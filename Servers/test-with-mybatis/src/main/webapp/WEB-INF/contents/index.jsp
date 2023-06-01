<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<h1>Hello World</h1>

	<h1>Struts2 - Hello World</h1>


<%-- 	<s:form action="hello">
		<s:textfield name="name" label="name" />
		<s:textfield name="branch" label="branch" />
		<s:textfield name="percentage" label="percentage" />
		<s:textfield name="phone" label="phone" />
		<s:textfield name="email" label="email" />
		<s:submit value="submit" />
	</s:form> --%>
	
	<h1>Struts2 - Form Login</h1>
	<s:form action="login">
		<s:textfield name="name" label="name" />
		<s:textfield name="email" label="email" />
		<s:submit value="submit" />
	</s:form>
</body>
</html>