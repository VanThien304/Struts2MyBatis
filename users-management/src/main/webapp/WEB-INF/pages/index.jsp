<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Page Index</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">User</div>
			<div class="col-6">
				<button id="show-modal" class="bg-primary">Add User</button>
			</div>
		</div>
	</div>

	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">Fullname</th>
					<th scope="col">Email</th>
					<th scope="col">Group</th>
					<t hscope="col">Active</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator var="user" value="users">
					<tr>
						<th scope="row">${id}</th>
						<td>${name}</td>
						<td>${email}</td>
						<td>${groupRoleId}</td>
						<td>${isActive}</td>
						<td><i class="fa-solid fa-pen"></i> <i
							class="fa-solid fa-trash"></i> <i class="fa-solid fa-user-xmark"></i></td>
					</tr>
				</s:iterator>
			</tbody>

		</table>
	</div>


	<%@ include file="/WEB-INF/pages/modalCreateUser.jsp" %>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"
		type="text/javascript"></script>

</body>
<script>
$(document).ready(function() {
    $("#show-modal").click(function() {
                $("#modal-create-user").modal("show"); 
            });
 
});


</script>
</html>