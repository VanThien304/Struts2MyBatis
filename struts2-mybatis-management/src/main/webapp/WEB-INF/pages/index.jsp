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

.main {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.listUserPagination {
	width: 100%;
	max-width: 768px;
	background-color: #FFF;
	border: 1px solid #ccc;
}

.listUserPagination .item {
	padding: 15px;
	border-bottom: 1px solid #ccc;
}

.listUserPagination .item {
	padding: 15px;
	border-bottom: 1px solid #ccc;
}

.listUserPagination .item:last-of-type {
	padding: 15px;
	border-bottom: none;
}

.pagenumbers {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	align-items: center;
}

.pagenumbers button {
	width: 50px;
	height: 50px;
	appearance: none;
	border: none;
	outline: none;
	cursor: pointer;
	background-color: #44AAEE;
	margin: 5px;
	transition: 0.4s;
	color: #FFF;
	font-size: 18px;
	text-shadow: 0px 0px 4px rgba(0, 0, 0, 0.2);
	box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.2);
}

.pagenumbers button:hover {
	background-color: #44eeaa;
}

.pagenumbers button.active {
	background-color: #44eeaa;
	box-shadow: 0px 0px 4px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>
	<div class="container p-2">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-4 d-flex justify-content-around">
				<div>
					<a href="">Products</a>
				</div>
				<div>
					<a href="customer">Customers</a>
				</div>
				<div>
					<a href="listUser">Users</a>
				</div>
			</div>
			<div class="col-4 d-flex justify-content-end">
				<a href="#">Admin</a>
			</div>
		</div>
		<div>
			<h3>Users</h3>
		</div>
	</div>

	<hr class="p-1" style="color: lightgrey" />

	<div class="container pb-4">
		<div class="row">
			<div class="col-12 d-flex">
				<!-- 	<h3>Search By Name</h3> -->

				<div class="col-3" id="searchForm">
					<div>
						<h5>Name</h5>
					</div>
					<input type="search" name="keyword" id="keywordInput"
						placeholder="Input fullname" />
				</div>

				<div class="col-3">
					<div>
						<h5>Group</h5>
					</div>
					<select name="groupRole" id="selectGroupRole"
						onchange="selectUserByGroup(this.value)">
						<option selected>Select Group</option>
						<option value="1">Admin</option>
						<option value="2">Editor</option>
						<option value="3">Reviewer</option>
					</select>
				</div>

				<div class="col-3">
					<div>
						<h5>Active</h5>
					</div>
					<select name="isActive" id="selectIsActive"
						onchange="getUserByActive(this.value)">
						<option selected>Select Active</option>
						<option value="1">Đang hoạt động</option>
						<option value="0">Tạm khóa</option>
					</select>
				</div>
			</div>
		</div>
	</div>

	<div class="container p-2">
		<div class="row">
			<div class="col-12 d-flex">
				<div class="col-4">
					<button type="button" id="show-modal" class="btn btn-primary">Add
						User</button>
				</div>
				
				<div class="col-4">
					<input type="file" id="excelFile" accept=".xlsx"/>
					<button onclick="importExcel()">Import Excel</button>
				</div>
				
				<div class="col-4">

					<input class="btn btn-primary" type="submit"
						onclick="searchUser(document.getElementById('keywordInput').value)"
						value="Search" />
					<!-- <input type="text" id="keywordInput" oninput="searchUser(this.value)"> -->

					<input class="btn btn-info" type="submit" onclick="resetSearch()"
						value="Delete" />


					<!-- <button id="logout">
						<a href="logout" onclick='return confirmLogout()'>Logout</a>
					</button> -->
				</div>

			</div>
		</div>
	</div>

	<div class="main">
		<div class="listUserPagination" id="list"></div>
		<div class="pagenumbers" id="pagination"></div>
	</div>


	<div class="container">
		<table id="allUser" class="table table-striped">
		<!--		<thead>
			 <tr>
					<th scope="col">#</th>
					<th scope="col">FullName</th>
					<th scope="col">Email</th>
					<th scope="col">Group</th>
					<th scope="col">Active</th>
					<th scope="col" class="text-center">Action</th>
				</tr> 
			</thead>-->
				<%--  	<tbody>


			<s:iterator var="user" value="users">
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

	<div id="modal-create-user" class="modal" tabindex="-1"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal Create User</h5>
					<button type="button" class="btn-close close"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modal-alert-danger hide"></div>
					<form id="frmCreate">
						<div class="form-row">
							<div class="col-sm-12">
								<div class="form-group p-2">
									<label for="name">Name:</label> <input class="form-control"
										type="text" name="name" id="creName" />
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
									<label for="booleanActive">Active:</label> <input
										type="checkbox" id="booleanActive" name="booleanActive"
										value="true" />
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" id="btnCreateUser"
						class="btn btn-primary p-2">Create</button>
					<button type="button" class="btn btn-secondary p-2 close"
						id="btnCloseCreateUser" data-bs-dismiss="modal">Close</button>
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
		
	<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
	
</body>

<script type="text/javascript">
	
	loadAllUsers();
	 
 	
 	 
	const list_element = document.querySelector('#allUser');
	const pagination_element = document.getElementById('pagination');

	let current_page = 1;
	let rows = 10;

	function DisplayList(items, wrapper, rows_per_page, page) {
	    wrapper.innerHTML = "";
	    page--;

	    let start = rows_per_page * page;
	    let end = start + rows_per_page;
	    const itemArray = Object.values(items);
	    let paginatedItems = itemArray.slice(start, end);

	    let table_element = document.createElement('table');
	    table_element.className = 'table';

	    let thead_element = document.createElement('thead');
	    let thead_row = "<tr>" +
	        "<th>ID</th>" +
	        "<th>Name</th>" +
	        "<th>Email</th>" +
	        "<th>Group Role</th>" +
	        "<th>Status</th>" +
	        "<th>Action</th>" +
	        "</tr>";
	    thead_element.innerHTML = thead_row;
	    table_element.appendChild(thead_element);

	    let tbody_element = document.createElement('tbody');
	    for (let i = 0; i < paginatedItems.length; i++) {
	        let item = paginatedItems[i];
	        var isActive = item.isActive == 1 ? "Đang hoạt động" : "Tạm khóa";
	        var groupRole = "";

	        if (item.groupRole == 1) {
	            groupRole = "Admin";
	        } else if (item.groupRole == 2) {
	            groupRole = "Editor";
	        } else {
	            groupRole = "Reviewer";
	        }
	        var row = "<tr>" +
	            "<td>" + item.id + "</td>" +
	            "<td>" + item.name + "</td>" +
	            "<td>" + item.email + "</td>" +
	            "<td>" + groupRole + "</td>" +
	            "<td>" + isActive + "</td>" +
	            "<td class='d-flex justify-content-between'>" +
	            "<div>" +
	            "<i onclick='showModalUpdateUser(" + item.id + ")' class='fa-solid fa-pen btn btn-primary' style='cursor: pointer'></i>" +
	            "</div>" +
	            "<div>" +
	            "<a onclick='return confirmBox();' href='deleteUserById?id=" + item.id + "' class='delete'>" +
	            "<i class='fa-solid fa-trash btn btn-danger'></i>" +
	            "</a>" +
	            "</div>" +
	            "<div>" +
	            "<a onclick='return confirmBoxActive();' href='setActiveUserById?id=" + item.id + "' class='activeUser'>" +
	            "<i class='fa-solid fa-user-xmark btn btn-dark'></i>" +
	            "</a>" +
	            "</div>" +
	            "</td>" +
	            "</tr>";
	        tbody_element.innerHTML += row;
	    }

	    table_element.appendChild(tbody_element);
	    wrapper.appendChild(table_element);
	}


	function SetupPagination (items, wrapper, rows_per_page) {
		wrapper.innerHTML = "";

		let page_count = Math.ceil(items.length / rows_per_page);
		for (let i = 1; i < page_count + 1; i++) {
			let btn = PaginationButton(i, items);
			wrapper.appendChild(btn);
		}
	}

	function PaginationButton (page, items) {
		let button = document.createElement('button');
		button.innerText = page;

		if (current_page == page) button.classList.add('active');

		button.addEventListener('click', function () {
			current_page = page;
			DisplayList(items, list_element, rows, current_page);

			let current_btn = document.querySelector('.pagenumbers button.active');
			current_btn.classList.remove('active');

			button.classList.add('active');
		});

		return button;
	}

/*  	 DisplayList(list_items, list_element, rows, current_page);
	SetupPagination(list_items, pagination_element, rows);   */
	
	
	 $("#show-modal").on('click',() => {
		 $("#modal-create-user").modal("show");
	}); 
	 
	 $("#btnCreateUser").on('click', () => {
		  $("#frmCreate").submit();
	});
		
		
	 $("#frmCreate").submit(function(event) {
		    event.preventDefault();
		    if ($("#frmCreate").valid()) {		        
		        doCreateUser();
		    }
	});	 
	
	 $("#btnLoadUsers").on('click',() => {
		 resetSearch();
	}); 
	 
	 
	function showModalUpdateUser(id) {
		$('#upId').val(id);
		$("#modal-update-user").modal("show");	
			$("#btnUpdateUser").on('click', function() {
				doUpdateUser(id);
		});
	}

	function resetSearch() {
	    // Xóa giá trị tìm kiếm đã nhập
	    $("#keywordInput").val("");

	    // Gọi Ajax để tải lại dữ liệu ban đầu (không có tìm kiếm)
	    searchUser("");
	    
	    $("#allUser tbody").html('');
	    
	    loadAllUsers();
	}
	
	/* function showPaginationUsers(currentPage){
		 $.ajax({
		        url: "http://localhost:8080/struts2-mybatis-login/paginationAction",
		        type: "GET",
		        dataType: "json",			        
		        data: {
		        	currentPage: currentPage
		        	},
		        success: function(data) {
		        	

		        	 DisplayList(data, list_element, rows, current_page);
	                 SetupPagination(data, pagination_element, rows); 
		        	if(data != null){
		        		$("#allUser tbody").html('');
		        		for(let i = 0; i < data.length; i++){
			        		user = data[i];
			        		
			        	}    	
			            $("#allUser tbody").append(user);
		        	}		        	
		        },
		        error: function(jqXHR, textStatus, errorThrown) {
		            console.log("Lỗi: " + textStatus, errorThrown);
		        }
		});
	} */
	
	
/* 	function searchUser(keyword) {
			 $.ajax({
			        url: "http://localhost:8080/struts2-mybatis-login/searchUser",
			        type: "GET",
			        dataType: "json",			        
			        data: {
			        	keyword: keyword
			        	},
			        success: function(data) {
			        	console.log("data = " + data);
			        	if (data !== null) {
			        		$('#search_fail').html("");
			        		$("#allUser tbody").html("");
			        		for(var i = 0; i < data.length; i++){
			        	var user = data[i];	     		
			        	var id = user.id;
			        	var name = user.name;
			        	var email = user.email;
			        	var isActive = user.isActive ==  0 ? "Đang hoạt động" : "Tạm khóa";
			 			var groupRole = "";

			 			    if (user.groupRole == 1) {
			 			        groupRole = "Admin";
			 			    } else if (user.groupRole == 2) {
			 			        groupRole = "Editor";
			 			    } else {
			 			        groupRole = "Reviewer";
			 			    }

			 			    var row = "<tr>" +
			 			        "<td>" + id + "</td>" +
			 			        "<td>" + name + "</td>" +
			 			        "<td>" + email + "</td>" +
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
			                $("#allUser tbody").prepend(row);
			        	}
			              } else {
			                displayError();
			              }
			        },
			        error: function(jqXHR, textStatus, errorThrown) {
			            console.log("Lỗi: " + textStatus, errorThrown);
			            $('#search_fail').prepend("<h3>"+'Không tìm thấy!'+"</h3>");
			        }
			    });
		  } */

		  
		  function importExcel() {
	            var fileInput = document.getElementById('excelFile');
	            var file = fileInput.files[0];
	            var reader = new FileReader();

	            reader.onload = function(e) {
	                var data = new Uint8Array(e.target.result);
	                var workbook = XLSX.read(data, { type: 'array' });

	                var worksheet = workbook.Sheets[workbook.SheetNames[0]];
	                var jsonData = XLSX.utils.sheet_to_json(worksheet, { header: 1 });

	                var table = document.querySelectTor('#allUser tbody');
	                table.innerHTML = '';

	                for (var i = 0; i < jsonData.length; i++) {
	                    var row = table.insertRow(i);
	                    for (var j = 0; j < jsonData[i].length; j++) {
	                        var cell = row.insertCell(j);
	                        cell.innerHTML = jsonData[i][j];
	                    }
	                }
	            };

	            reader.readAsArrayBuffer(file);
	        }	  
		  
		  
	function selectUserByGroup(groupRole) {
				 $.ajax({
				        url: "http://localhost:8080/struts2-mybatis-login/selectUserByGroup",
				        type: "GET",
				        dataType: "json",			        
				        data: {
				        	groupRole: groupRole
				        	},
				        success: function(data) {
				        	
				        	
				        	if (data !== null) {
				        		 $("#allUser tbody").html('');
				        		 DisplayList(data, list_element, rows, current_page);
							        
				                 SetupPagination(data, pagination_element, rows); 
				        	for(var i = 0; i < data.length; i++){
					        	var user = data[i];	   
					        	var row = renderUser(user);
					                $("#allUser tbody").append(row);
				        		 }
				              } else {
				                displayError();
				              }
				        },
				        error: function(jqXHR, textStatus, errorThrown) {
				            console.log("Lỗi: " + textStatus, errorThrown);
				        }
				});
	} 
		
		  
	 function getUserByActive(isActive) {
				 $.ajax({
				        url: "http://localhost:8080/struts2-mybatis-login/getUserByActive",
				        type: "GET",
				        dataType: "json",			        
				        data: {
				        	isActive:isActive
				        	},
				        success: function(data) {
				        	console.log("data = " + data);
				        	if (data !== null) {
				        		 $("#allUser tbody").html('');
				        		 DisplayList(data, list_element, rows, current_page);
							        
				                 SetupPagination(data, pagination_element, rows); 
				        	for(var i = 0; i < data.length; i++){
					        	var user = data[i];	   
					        	
					                $("#allUser tbody").append(user);
				        		 }
				              } else {
				                displayError();
				              }
				        },
				        error: function(jqXHR, textStatus, errorThrown) {
				            console.log("Lỗi: " + textStatus, errorThrown);
				        }
				});
	} 	   
		
	
	 function searchUser(keyword) {
		 $.ajax({
		        url: "http://localhost:8080/struts2-mybatis-login/searchUser",
		        type: "GET",
		        dataType: "json",			        
		        data: {
		        	keyword: keyword
		        	},
		        success: function(data) {
		        	console.log("data = " + data);
		        	 DisplayList(data, list_element, rows, current_page);
				        
	                 SetupPagination(data, pagination_element, rows); 
		        	if (data !== null) {
		        		 $("#allUser tbody").html('');
		        		 if(data.length !== 0){	
		        	for(var i = 0; i < data.length; i++){
			        	var user = data[i];	   
			        	var row = renderUser(user);
			                $("#allUser tbody").append(row);
			        }
		        		 }else{
		        			 var noDataMessage = "<tr><td style='color: red;' colspan='6' class='text-center'>Không có dữ liệu</td></tr>";
		                     $("#allUser tbody").append(noDataMessage);
		        		 }
		              } else {
		                displayError();
		              }
		        },
		        error: function(jqXHR, textStatus, errorThrown) {
		            console.log("Lỗi: " + textStatus, errorThrown);
		        }
		    });
	  } 
		
	
	function doUpdateUser(id) {
		if ($("#frmUpdate").valid()) {	
		    var name = $('#upName').val();
		    var email = $('#upEmail').val();
		    var password = $('#upPassword').val();
		    var confirmPassword = $('#upComPassword').val();
		    var groupRole = $('#upGroupRole').val();
		    var booleanActive = $('#booleanActive').is(':checked');

		    $.ajax({
		        url: "http://localhost:8080/struts2-mybatis-login/updateUserById",
		        type: "POST",
		        dataType: "JSON",
		        data: {
		            id: id,
		            name: name,
		            email: email,
		            password: password,
		            confirmPassword: confirmPassword,
		            booleanActive: booleanActive ? 1: 0,
		            groupRole: groupRole
		        },
		        success: function(data) {
		            // Handle the success response
		            console.log("User updated successfully:", data);
		          
	                loadAllUsers();
	                $("#modal-update-user").modal("hide");	
		        },
		        error: function(jqXHR, textStatus, errorThrown) {
		            // Handle the error response
		            console.log("Error updating user:", textStatus, errorThrown);
		        }
		    });
		}
	 }
	
	 
	 function doCreateUser(){
		        var name = $("#creName").val();
		        var email = $("#creEmail").val();
		        var password = $("#crePassword").val();
		        var confirmPassword = $("#creConPassword").val();
		        var groupRole = $("#groupRole").val();
		        var booleanActive = $("#booleanActive").is(":checked") ? true : false;

		        // Tạo đối tượng dữ liệu để gửi đi
		        var userData = {
		            name: name,
		            email: email,
		            password: password,
		            confirmPassword: confirmPassword,
		            groupRole: groupRole,
		            booleanActive: booleanActive,
		        };

		        // Gửi yêu cầu AJAX để tạo người dùng
		        $.ajax({
		            type: "POST",
		            url: "http://localhost:8080/struts2-mybatis-login/createUser",
		            data: userData,
		            success: function(data) {
		                console.log("User created successfully: ", data);
		                // Thực hiện các hành động bổ sung sau khi tạo người dùng thành 
		                $("#allUser tbody").html('');
		                var newUserRow = renderUser(data);
		                $("#allUser tbody").append(newUserRow);
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

	 
 	 function getUserById(id) {
		    $.ajax({
		        url: "http://localhost:8080/struts2-mybatis-login/getUserById",
		        type: "GET",
		        dataType: "json",
		        data: {id:id},
		        success: function(data) {
		        	 var user = data.user;
		        	 console.log("user= "+ user)
		          
		        },
		        error: function(jqXHR, textStatus, errorThrown) {
		            console.log("Lỗi: " + textStatus, errorThrown);
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
		        	 var users = data.user;
		        	 DisplayList(users, list_element, rows, current_page);
		        
	                 SetupPagination(users, pagination_element, rows); 
	                   $.each(users, function(index, user) { 
	                	   
			            $("#allUser tbody").append(user); 
		            });      
        
		        },
		        error: function(jqXHR, textStatus, errorThrown) {
		            console.log("Lỗi: " + textStatus, errorThrown);
		        }
		    });
		}

		
	$(".delete").click(function() {
		$.ajax({
			type : "POST",
			url : "http://localhost:8080/struts2-mybatis-login/deleteUserById",
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
	

	function confirmLogout() {
		var answer;
		answer = window.confirm("Are you sure to logout page ?");
		if (answer == true) {
			return true;
		} else {
			return false;
		}
	}
    
	function confirmBox() {
		var answer;
		answer = window.confirm("Are you sure to delete this user id ?");
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
						minlength : 6,
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
						pwcheck : true
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
						minlength : "Độ dài tối thiểu là 6 ký tự",
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
						pwcheck : "Mật khẩu phải có tối thiểu 1 chữ hoa, 1 chữ thường và một số!",
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
	
			$.validator.addMethod("pwcheck", function(value) {
  			 	return /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$/.test(value)   			 
			});

	
			$("#frmUpdate").validate(
			{
				rules : {
					name : {
						required : true,
						minlength : 6,
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
						pwcheck : true,
						maxlength : 35,
					},
					confirmPassword : {
						required : true,
						minlength : 6,
						maxlength : 35,
						equalTo: "#upPassword"
					}
				},
				messages : {
					name : {
						required : "Vui lòng nhập tên đầy đủ",
						minlength : "Độ dài tối thiểu là 6 ký tự",
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
						pwcheck : "Mật khẩu phải có tối thiểu 1 chữ hoa, 1 chữ thường và một số!",
					},
					confirmPassword : {
						required : "Vui lòng xác nhận mật khẩu!",
						minlength : "Độ dài tối thiểu là 6 ký tự",
						maxlength : "Độ dài tối đa là 35 ký tự",
						equalTo: "Mật khẩu xác nhận không khớp",
					}
				},
				errorLabelContainer : "#modal-update-user .modal-alert-danger",
				errorPlacement : function(error, element) {
					error.appendTo("#modal-update-user .modal-alert-danger");
				},
				showErrors : function(errorMap, errorList) {
					if (this.numberOfInvalids() > 0) {
						$("#modal-update-user .modal-alert-danger")
								.removeClass("hide").addClass("show");
					} else {
						$("#modal-update-user .modal-alert-danger")
								.removeClass("show").addClass("hide").empty();
						$("#frmUpdate input.error").removeClass("error");
					}
					this.defaultShowErrors();
				},
			 	
			})
			
			
	$(".close").on('click', function() {
		    // Reset lại form
		    $("#frmCreate").validate().resetForm();
		    // Xóa thông báo lỗi
		    $("#modal-create-user .modal-alert-danger").removeClass("show").addClass("hide").empty();
		    // Xóa lớp error trên các trường input
		    $("#frmCreate input.error").removeClass("error");  
	}); 
		
 	$(".close").on('click', function() {
	    // Reset lại form
	    $("#frmUpdate").validate().resetForm();
	    // Xóa thông báo lỗi
	    $("#modal-update-user .modal-alert-danger").removeClass("show").addClass("hide").empty();
	    // Xóa lớp error trên các trường input
	    $("#frmUpdate input.error").removeClass("error");
	 }); 
</script>
</html>