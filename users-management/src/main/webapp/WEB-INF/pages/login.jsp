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
	<s:fielderror name="invalid"/>
	<s:form action="login" method="post" validate="true">
		<s:textfield name="email" label="Email" id="email" />
		<s:textfield name="password" label="Password" id="password" />
		<s:submit value="Login"/>
	</s:form>

</body>
<script type="text/javascript">
	function validationFormLogin() {
		var email = document.getElementById("email").value;
		var password = document.getElementById("password").value;
		var errorMessage = "";

		if (email == "") {
			errorMessage += "Email is required.\n";

		}
		if (password == "") {
			errorMessage += "Password is required.\n";
		}

		if (errorMessage != "") {
			alert(errorMessage);
			return false;
		} else {
			return true;
		}
	}
</script>
</html>