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
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap5.min.js"></script>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
/* Thiết lập kiểu cho checkbox */
input[type="checkbox"] {
	width: 20px;
	height: 20px;
	/* Màu viền checkbox */
	margin-left: 40px;
	border-radius: 4px;
}

.modal-alert-danger {
	padding: 10px 35px;
	margin-bottom: 15px;
	color: #842029;
	background-color: #f8d7da;
	border-color: #f5c2c7;
}

.modal-alert-danger label {
	display: list-item;
}

.hide {
	display: none;
}

.show {
	display: block !important;
}

#message-alert {
	width: 100vw;
	position: fixed;
	bottom: 0;
}

.alert-success {
	padding: 1rem 135px;
}

.alert-danger {
	padding: 1rem 135px;
}

.alert-danger h5 {
	margin-left: -18px;
}

.alert-danger ul {
	margin-left: -2rem;
}

label.error {
	display: list-item;
}

input.error {
	border: solid 1px red;
}

.thumbnail {
	width: 90px;
	height: 70px;
	overflow: hidden;
}

.thumbnail img {
	width: 100%;
	height: 100%;
	transition-duration: 0.3s;
}

.thumbnail img:hover {
	transform: scale(1.2);
}
</style>
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


	<div id="modal-create-user" class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal Create User</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modal-alert-danger hide"></div>
					<form id="frmCreate">

						<div class="form-row">

							<div class="col-sm-12">
								<div class="form-group p-2">
									<div>Name:</div>
									<input class="form-control" type="text" name="name"
										id="creName" />
								</div>
								<div class="form-group p-2">
									<div>Email:</div>
									<input class="form-control" type="email" name="email"
										id="creEmail" />
								</div>
								<div class="form-group p-2">
									<div>Password:</div>
									<input class="form-control" type="password" name="password"
										id="crePassword" />
								</div>

								<div class="form-group p-2">
									<div>ConfirmPassword:</div>
									<input class="form-control" type="password"
										name="confirmPassword" id="creConPassword" />
								</div>

								<div class="form-group p-2 d-flex">
									<div>GroupRole:</div>
									<select name="groupRole" id="groupRole"
										style="margin-left: 9px;">
										<option value="1" ${groupRole == 1 ? 'selected' : ''}>Admin</option>
										<option value="2" ${groupRole == 2 ? 'selected' : ''}>Editor</option>
										<option value="3" ${groupRole == 3 ? 'selected' : ''}>Reviewer</option>
									</select>



								</div>
								<div class="form-group p-2 d-flex">
									<label for="booleanActive">Active:</label>
									<s:checkbox id="creIsActive" name="booleanActive"
										fieldValue="true" value="true" />

								</div>

							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" id="formCreateUser"
						class="btn btn-primary p-2">Create</button>
					<button type="button" class="btn btn-secondary p-2"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
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


	

	
	
	loadAllUsers();
	 
	function confirmLogout() {
		var answer;
		answer = window.confirm("Are you sure to logout page ?");
		if (answer == true) {
			return true;
		} else {
			return false;
		}
	}

	 $("#show-modal").on('click',() => {
		 $("#modal-create-user").modal("show");
	}); 
	 
	 $("#formCreateUser").on('click', function() {
		  $("#frmCreate").submit();
		});

	 
	 $("#frmCreate").submit(function(event) {
		    event.preventDefault(); // Ngăn chặn hành động mặc định của submit

		    if ($("#frmCreate").valid()) {
		        // Nếu form hợp lệ, thực hiện hành động tạo người dùng
		        doCreateUser();
		    }
		});
	
 
	 
	 function doCreateUser(){
		
		        var name = $("#creName").val();
		        var email = $("#creEmail").val();
		        var password = $("#crePassword").val();
		        var confirmPassword = $("#creConPassword").val();
		        var groupRole = $("#groupRole").val();
		        var booleanActive = $("#booleanActive").is(":checked") ? "true" : "false";


		        // Tạo đối tượng dữ liệu để gửi đi
		        var userData = {
		            name: name,
		            email: email,
		            password: password,
		            confirmPassword: confirmPassword,
		            groupRole: groupRole,
		            booleanActive: booleanActive
		        };

		        // Gửi yêu cầu AJAX để tạo người dùng
		        $.ajax({
		            type: "POST",
		            url: "http://localhost:8080/struts2-mybatis-login/createUser",
		            data: userData,
		            success: function(data) {
		                console.log("User created successfully:", data);
		                // Thực hiện các hành động bổ sung sau khi tạo người dùng thành 
		                $("#allUser tbody").empty();
		                loadAllUsers();
		                $("#modal-create-user").modal("hide");
		                
		               
		                $("#frmCreate")[0].reset();
		            },
		            error: function(xhr, status, error) {
		                console.log("Error creating user:", error);
		                // Xử lý lỗi nếu có
		            }
		        });
		  
	 }
	 
	
	 function renderUser(user) {
			 var isActive = user.isActive == 1 ? "Đang hoạt động" : "Tạm khóa";
			    var groupRole = "";

			    if (user.groupRole == 1) {
			        groupRole = "Admin";
			    } else if (user.groupRole == 2) {
			        groupRole = "Editor";
			    } else {
			        groupRole = "Reviewer";
			    }

			    var row = "<tr>" +
			        "<td>" + user.id + "</td>" +
			        "<td>" + user.name + "</td>" +
			        "<td>" + user.email + "</td>" +
			        "<td>" + groupRole + "</td>" +
			        "<td>" + isActive + "</td>" +
			        "<td class='d-flex justify-content-between'>" +
			        "<div>" +
			        "<i onclick='showModalUpdateUser(" + user.id + ")' class='fa-solid fa-pen btn btn-primary' style='cursor: pointer'></i>" +
			        "</div>" +
			        "<div>" +
			        "<a onclick='return confirmBox();' href='deleteUserById?id=" + user.id + "' class='delete'>" +
			        "<i class='fa-solid fa-trash btn btn-danger'></i>" +
			        "</a>" +
			        "</div>" +
			        "<div>" +
			        "<a onclick='return confirmBoxActive();' href='setActiveUserById?id=" + user.id + "' class='activeUser'>" +
			        "<i class='fa-solid fa-user-xmark btn btn-dark'></i>" +
			        "</a>" +
			        "</div>" +
			        "</td>" +
			        "</tr>";

			    return  $("#allUser tbody").append(row);;
		}

	 
	 function loadAllUsers() {
		    $.ajax({
		        url: "http://localhost:8080/struts2-mybatis-login/getAllUsersJSON",
		        type: "GET",
		        dataType: "json",
		        success: function(data) {
		            $.each(data.user, function(index, user) {
		                var row = renderUser(user);
		                $("#allUser tbody").append(row);
		            });
		        },
		        error: function(jqXHR, textStatus, errorThrown) {
		            console.log("Lỗi: " + textStatus, errorThrown);
		        }
		    });
		}

		loadAllUsers();
	 
    
    
	/* function loadAllUsers() {
		$.ajax({
					url : "http://localhost:8080/struts2-mybatis-login/getAllUsersJSON",
					type : "GET",
					dataType : "json",
					success : function(data) {
						$.each(data.user,
										function(index, user) {

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
											} else {
												row += "<td>Reviewer</td>"
											}
											row += "<td>"
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
	 */

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
	
	

	$("#frmCreate").validate(
			{
				rules : {
					name : {
						required : true,
						minlength : 3,
						maxlength : 35
					},
					email : {
						required : true,
						minlength : 9,
						maxlength : 35,
					},
					password : {	
						required : true,
						minlength : 6,
						maxlength : 35,
					},
					confirmPassword : {
						required : true,
						minlength : 6,
						maxlength : 35,
						equalTo: "#crePassword"
					}
				},
				messages : {
					name : {
						required : "Vui lòng nhập tên đầy đủ",
						minlength : "Độ dài tối thiểu là 3 ký tự",
						maxlength : "Độ dài tối đa là 35 ký tự"
					},
					email : {
						required : "Vui lòng nhập địa chỉ email!",
						minlength : "Độ dài tối thiểu là 9 ký tự",
						maxlength : "Độ dài tối đa là 35 ký tự",
						email: "Vui lòng nhập đúng định dạng email"
					},
					password : {
						required : "Vui lòng nhập mật khẩu!",
						minlength : "Độ dài tối thiểu là 6 ký tự",
						maxlength : "Độ dài tối đa là 35 ký tự",
					},
					confirmPassword : {
						required : "Vui lòng xác nhận mật khẩu!",
						minlength : "Độ dài tối thiểu là 6 ký tự",
						maxlength : "Độ dài tối đa là 35 ký tự",
						equalTo: "Mật khẩu xác nhận không khớp",
					}
				},
				errorLabelContainer : "#modal-create-user .modal-alert-danger",
				errorPlacement : function(error, element) {
					error.appendTo("#modal-create-user .modal-alert-danger");
				},
				showErrors : function(errorMap, errorList) {
					if (this.numberOfInvalids() > 0) {
						$("#modal-create-user .modal-alert-danger")
								.removeClass("hide").addClass("show");
					} else {
						$("#modal-create-user .modal-alert-danger")
								.removeClass("show").addClass("hide").empty();
						$("#frmCreate input.error").removeClass("error");
					}
					this.defaultShowErrors();
				},
			 	
			})
	
</script>
</html>