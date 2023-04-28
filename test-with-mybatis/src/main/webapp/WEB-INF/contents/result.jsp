<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<h3>name ${student.name}</h3>
	<h3>branch ${student.branch}</h3>
	<h3>percentage ${student.percentage}</h3>
	<h3>phone ${student.phone}</h3>
	<h3>email ${student.email}</h3>
	
	<h1>New Student id = ${student.getId()}</h1>
	<h3>${student.getName()}</h3>
	<h3>${student.getBranch()}</h3>
	<h3>${student.getPercentage()}</h3>
	<h3>${student.getPhone()}</h3>
	<h3>${student.getEmail()}</h3>
</body>
</html>