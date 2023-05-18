<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Page Customer</title>
</head>
<body>
	<h1>Welcome to Customer Page!</h1>
	<h3>Hello <s:property value="#session['user'].userName"/></h3><br>
	<a href="action/logout">Logout</a>
</body>
</html>