<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<title>Login App</title>
<s:head />
</head>
<body>
	<h1>Login App</h1>

	
	<s:form action="loginAction" validate="true" method="post"
		namespace="/">
		<input type="hidden" value="login"/>
		<s:textfield name="email" label="Email"></s:textfield>
		<s:password name="password" label="Password" />
		<s:submit value="Login" />
	</s:form>


	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"
		type="text/javascript"></script>
</body>
</html>