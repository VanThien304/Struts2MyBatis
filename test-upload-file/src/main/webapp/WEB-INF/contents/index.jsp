<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<h1>Hello World</h1>

	<h1>Struts2 - UPLOAD FILE</h1>

	<s:form action="doUpload" method="post" enctype="multipart/form-data">
		<s:file name="upload" label="File" />
		<s:submit />
	</s:form>

</body>
</html>