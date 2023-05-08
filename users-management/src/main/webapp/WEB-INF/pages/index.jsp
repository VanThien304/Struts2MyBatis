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
			<div class="col-6 d-flex justify-content-end">
				<button id="show-modal" class="bg-primary">Add User</button>
			</div>
		</div>
	</div>

	<div class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">FullName</th>
					<th scope="col">Email</th>
					<th scope="col">Group</th>
					<th scope="col">Active</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator var="user" value="users">
					<tr>
						<td id="userId" scope="row">${id}</td>
						<td>${name}</td>
						<td>${email}</td>
						<td>${groupRole}</td>
						<td>${isActive}</td>
						<td class="d-flex justify-content-between">
							<div>
								<button class="edit">
									<i id="${id}" class="fa-solid fa-pen"></i>
								</button>
							</div>
							<div>
								<a onclick="return confirmBox();"
									href="deleteUserById.action?id=${id}" class="delete"> <i
									class="fa-solid fa-trash"></i>
								</a>

							</div>
							<div>
								<i class="fa-solid fa-user-xmark"></i>
							</div>
						</td>

					</tr>
				</s:iterator>
			</tbody>

		</table>
	</div>
	
<s:form action="getUserById">
	<s:textfield name="id"/>
	<s:submit/>
</s:form>

	<%@ include file="modalCreateUser.jsp"%>
	<%@ include file="modalUpdateUser.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"
		type="text/javascript"></script>

</body>
<script>
	$("#show-modal").click(function() {
		$("#modal-create-user").modal("show");
	});

	$(".edit").click(function() {
		$("#modal-update-user").modal("show");
		
		$('#nameUp').val() = ${name};
		$('#emailUp').val() = ${email};
		$('#passwordUp').val() = ${password};
		$('#groupRoleUp').val() = ${groupRole};
		
	});

	 $function getUserById(id) {
	 $.ajax({
	 url: "<s:url action="getUserById"/>",
	 type: "GET",
	 dataType: "json",
	 success: function(data) {
	
	 console.log("UserId: " + data);
	 }
	 });
	 }; 

	$(".delete").click(function() {

	});

	function confirmBox() {
		var answer;
		answer = window.confirm("Are you sure to delete this user id?");
		if (answer == true) {
			return true;
		} else {
			return false;
		}
	}

	/* $(document).ready(function(){
	 $(".delete").click(function(){
		 var id = getUserById();
		 alert(id);
	alert("id")
		 $.ajax({
			 type:"POST",
				url:"deleteUserById.action?id=${id}",
				dataType: "JSON",
				data:{id: id},
				
				success: function(res){
					alert(res);
					if(res.success){
						 alert("Record deleted successfully.");
						$(that).closest('tr').remove();
						
					}else{
						alert(res.msg)
					}
				} 
			 
		 })

	});
	});  */
</script>
</html>