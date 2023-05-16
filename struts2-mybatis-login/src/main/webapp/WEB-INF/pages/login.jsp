<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login App</title>
<s:head/>
</head>
<body>
	<h1>Login App</h1>
	
		<s:fielderror name="invalid"/>
		<s:form action="loginAction" validate="true" method="post" namespace="/action">
			<s:textfield name="email" label="Email"/>
			<s:password name="password" label="Password"/>
			<s:submit value="Login"/>
		</s:form>
	
	
</body>
</html>