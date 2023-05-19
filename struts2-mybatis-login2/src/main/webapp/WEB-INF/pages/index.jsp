<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Page Index</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-3">
				<!-- 	<h3>Search By Name</h3> -->

				<form id="searchForm">
					<input type="text" name="keyword" id="keyword" />
					<button type="button" onclick="submitSearch()">Search</button>
				</form>



			</div>
			<div class="col-6 d-flex justify-content-end">
				<button id="show-modal" class="bg-primary" style="height: 35px">Add
					User</button>
			</div>
			<div class="col-3">
				<!-- 	<h3>Search By Name</h3> -->

				<button id="logout">
					<a href="logout" onclick='return confirmLogout()'>Logout</a>
				</button>



			</div>
		</div>
	</div>

	<div class="container">
		<table id="allUser" class="table table-striped">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">FullName</th>
					<th scope="col">Email</th>
					<th scope="col">Group</th>
					<th scope="col">Active</th>
					<th scope="col" class="text-center">Action</th>
				</tr>
			</thead>
			<tbody>
			

				<%-- 	<s:iterator var="user" value="users">
					<tr>
						<!-- <td>${user}</td> -->
						<td id="userId" scope="row"><s:property value="#user.getId()" />
						</td>
						<td><s:property value="#user.getName()" /></td>
						<td><s:property value="#user.getEmail()" /></td>
						<s:if test="%{#user.getGroupRole() == 1}">
							<td>Admin</td>
						</s:if>
						<s:elseif test="%{#user.getGroupRole() == 2}">
							<td>Editor</td>
						</s:elseif>
						<s:else>
							<td>Reviewer</td>
						</s:else>
						<td><s:property
								value="%{#user.getIsActive() == 1 ? 'Đang hoạt động' : 'Tạm khóa'}" /></td>
						<td class="d-flex justify-content-between">
							<div>
								<i onclick="showModalUpdateUser(${id})"
									class="fa-solid fa-pen btn btn-primary" style="cursor: pointer"></i>
								<s:include value="modalUpdateUser.jsp">
									<s:param name="user"></s:param>
								</s:include>
							</div>
							<div>
								<a onclick="return confirmBox();"
									href="deleteUserById?id=${id}" class="delete"> <i
									class="fa-solid fa-trash btn btn-danger"></i>
								</a>
							</div>
							<div>
								<a onclick="return confirmBoxActive();"
									href="setActiveUserById?id=${id}" class="activeUser">
									<i class="fa-solid fa-user-xmark btn btn-dark"></i>
								</a>
							</div>
						</td>
					</tr>
				</s:iterator>  --%>

			</tbody>

		</table>

	</div>


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
<script type="text/javascript">
	/* 	$(document).ready(function () {
	 $('#allUser').DataTable();
	 }); */

	function confirmLogout() {
		var answer;
		answer = window.confirm("Are you sure to logout page ?");
		if (answer == true) {
			return true;
		} else {
			return false;
		}
	}

	$("#show-modal").click(function() {
		$("#modal-create-user").modal("show");
	});

	function loadAllUsers() {
		$
				.ajax({
					url : "http://localhost:8080/struts2-mybatis-login/getAllUsersJSON",
					type : "GET",
					dataType : "json",
					success : function(data) {
						// Thêm các user vào bảng
						console.log("getAllUsers");
						console.log("data" + data);
						$
								.each(
										data.user,
										function(index, user) {
											console.log("data", data.user)
											var selectedRole = $("#selectRole")
													.val();
											var groupRole = user.groupRole;
											switch (selectedRole) {
											case "Admin":
												groupRole = "Admin";
												break;
											case "Editor":
												groupRole = "Editor";
												break;
											default:
												groupRole = "Reviewer";
												break;
											}
											var isActive = user.isActive == 1 ? "Đang hoạt động"
													: "Tạm khóa";
											var row = "<tr>" + "<td>" + user.id
													+ "</td>" + "<td>"
													+ user.name + "</td>"
													+ "<td>" + user.email
													+ "</td>"
											if (user.groupRole == 1) {
												row += "<td>Admin</td>"
											} else if (user.groupRole == 2) {
												row += "<td>Editor</td>"
											}else{
												row += "<td>Reviewer</td>"
											}
												row	+="<td>"
													+ isActive
													+ "</td>"
													+ "<td class='d-flex justify-content-between'>"
													+ "<div>"
													+ "<i onclick='showModalUpdateUser("
													+ user.id
													+ ")' class='fa-solid fa-pen btn btn-primary' style='cursor: pointer'></i>"
													+ "</div>"
													+ "<div>"
													+ "<a onclick='return confirmBox();' href='deleteUserById?id="
													+ user.id
													+ "' class='delete'>"
													+ "<i class='fa-solid fa-trash btn btn-danger'></i>"
													+ "</a>"
													+ "</div>"
													+ "<div>"
													+ "<a onclick='return confirmBoxActive();' href='setActiveUserById?id="
													+ user.id
													+ "' class='activeUser'>"
													+ "<i class='fa-solid fa-user-xmark btn btn-dark'></i>"
													+ "</a>" + "</div>"
													+ "</td>" + "</tr>";
											$("#allUser tbody").append(row);
										});
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("Lỗi: " + textStatus, errorThrown);

					}
				});

	}
	loadAllUsers();

	/*   $(document).on("click", "#first", function () {
	      currentPage = 1;
	      fetchUsers();
	  });

	  $(document).on("click", "#prev", function () {
	      if (currentPage > 1) {
	          currentPage--;
	          fetchUsers();
	      }
	  });

	  $(document).on("click", "#next", function () {
	      currentPage++;
	      fetchUsers();
	  });

	  $(document).on("click", "#last", function () {
	      currentPage = ${totalPages};
	      fetchUsers();
	  });
	 */
	/* 	function getUsersPagination(){
	 $.ajax({
	 url: 'paginationJSON.action',
	 type:'POST',
	 dataType:'json',
	 data:{
	 currentPage: page
	 },
	 success: function(data){
	 console.log(data);
	 $("#allUser").html(data);
	 },
	 error: function(xhr, status, error){
	 console.log(error);
	 }
	 });
	 } */

	/* getUsersPagination(); */

	$(document).on('click', '.pagination-link', function(e) {
		e.preventDefault();
		var page = $(this).data('page');
		getUsersPagination(page);
	});

	function confirmBox() {
		var answer;
		answer = window.confirm("Are you sure to delete this user id ?");
		if (answer == true) {
			return true;
		} else {
			return false;
		}
	}

	$(".delete").click(function() {
		$.ajax({
			type : "POST",
			url : "deleteUserById.action?id=${id}",
			dataType : "JSON",
			data : {
				id : id
			},

			success : function(res) {
				alert(res);
				if (res.success) {
					alert("Record deleted successfully.");
					$(that).closest('tr').remove();
				} else {
					alert(res.msg)
				}
			}

		})

	});

	function confirmBoxActive() {
		var answer;
		answer = window.confirm("Are you sure to change active this user id?");
		if (answer == true) {
			return true;
		} else {
			return false;
		}
	}

	/* $(".activeUser").click(function() {
		$.ajax({
			type : "POST",
			url : "setActiveUserById.action?id=${id}",
			dataType : "JSON",
			data : {
				id : id
			},

			success : function(res) {
				alert(res);
				if (res.success) {
					alert("Record set active successfully.");
				} else {
					alert(res.msg)
				}
			}

		})

	});
	 */

	/*    function getUserByActive() {
	        return (
	            $.ajax({
	                headers: {
	                    "Accept": 'application/json',
	                    "Content-type": 'application'
	                },
	                type: "GET",
	                url: "getUserByActive.action",
	            }).done((data) => {
	            	var user =data;
	            
	            }).fail((jxHQR) => {
	                console.log(jxHQR)
	            })
	        )
	    }
	 */
	/* function submitSearch() {
		var keyword = $("#keyword").val();
		$.ajax({
			url: "searchUser.action",
			data: { keyword: keyword },
			type: "GET",
			success: function(result) {
				console.log(result)
				 $("#searchResults").html(result);
			}
			 error: function() {
			        alert("Error occurred while searching for users.");
		});
		
	} */
</script>
</html>