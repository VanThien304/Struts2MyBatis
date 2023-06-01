<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Page Customer</title>

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
			<h3>Customers</h3>
		</div>
	</div>

	<hr class="p-1" style="color: lightgrey" />

	<div class="container pb-4">
		<div class="row">
			<div class="col-12 d-flex">
				<!-- 	<h3>Search By Name</h3> -->

				<div class="col-3" id="searchForm">
					<div>
						<h5>List Customer</h5>
					</div>
					<input type="search" name="keyword" id="keywordInput"
						placeholder="Input fullname" />
				</div>

				<div class="col-3">
					<div>
						<h5>Address</h5>
					</div>
					<input type="search" name="" id="" placeholder="Input Address" />
				</div>

				<div class="col-3">
					<div>
						<h5>Active</h5>
					</div>
					<select name="isActive" id="selectIsActive"
						onchange="getCustomerByActive(this.value)">
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
					<!-- <input type="file" id="excelFile" accept=".xlsx" />
					<button onclick="importExcel()">Import Excel</button> -->

					 <s:form action="importExcelAction" method="post" namespace="/customer" enctype="multipart/form-data">
						<s:file name="fileUpload" label="File"/>
						<s:submit value="Import"/>
					</s:form> 
					<%-- <s:form action="exportExcelAction" method="post" namespace="/customer">
						<input type="submit" value="Export Excel" />
					</s:form> --%>
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
		<table id="allCustomer" class="table table-striped">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">FullName</th>
					<th scope="col">Email</th>
					<th scope="col">Address</th>
					<th scope="col">PhoneNumber</th>
					<th scope="col" class="text-center">Action</th>
				</tr>
			</thead>
			<tbody>
			</tbody>

		</table>
	</div>

	<div id="modal-create-customer" class="modal" tabindex="-1"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal Create Customer</h5>
					<button type="button" class="btn-close close"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modal-alert-danger hide"></div>
					<form id="frmCreateCustomer">
						<div class="form-row">
							<div class="col-sm-12">
								<div class="form-group p-2">
									<label for="name">Name:</label> <input class="form-control"
										type="text" name="customer_name" id="cre_name" />
								</div>
								<div class="form-group p-2">
									<div>Email:</div>
									<input class="form-control" type="email" name="customer_email"
										id="cre_email" />
								</div>

								<div class="form-group p-2">
									<div>Phone:</div>
									<input class="form-control" type="number" name="customer_phone"
										id="cre_phone" />
								</div>

								<div class="form-group p-2">
									<div>Address:</div>
									<input class="form-control" type="text" name="customer_address"
										id="cre_address" />
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
					<button type="submit" id="btnCreateCustomer"
						class="btn btn-primary p-2">Create</button>
					<button type="button" class="btn btn-secondary p-2 close"
						id="btnCloseCreateCustomer" data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>


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
	
	loadAllCustomer();
	 
 	
 	 
	const list_element = document.querySelector('#allCustomer');
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
	        "<th>ADDRESS</th>" +
	        "<th>PHONENUMBER</th>" +
	        "<th>Action</th>" +
	        "</tr>";
	    thead_element.innerHTML = thead_row;
	    table_element.appendChild(thead_element);

	    let tbody_element = document.createElement('tbody');
	    for (let i = 0; i < paginatedItems.length; i++) {
	        let item = paginatedItems[i];
	        var isActive = item.isActive == 1 ? "Đang hoạt động" : "Tạm khóa";
	        var row = "<tr>" +
	            "<td>" + item.customerId + "</td>" +
	            "<td>" + item.customerName + "</td>" +
	            "<td>" + item.email + "</td>" +
	            "<td>" + item.address + "</td>" +
	            "<td>" + item.telNum + "</td>" +
	            "<td class='d-flex justify-content-between'>" +
	            "<div>" +
	            "<i onclick='showModalUpdateCustomer(" + item.customerId + ")' class='fa-solid fa-pen btn btn-primary' style='cursor: pointer'></i>" +
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
		 $("#modal-create-customer").modal("show");
	}); 
	 
	 $("#btnCreateCustomer").on('click', () => {
		  $("#frmCreateCustomer").submit();
	});
		
		
	 $("#frmCreateCustomer").submit(function(event) {
		    event.preventDefault();
		    if ($("#frmCreateCustomer").valid()) {		        
		        doCreateCustomer();
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


	
	function getCustomerById(customerId){ 
		 $.ajax({
		        url: "http://localhost:8080/struts2-mybatis-login/customer/getCustomerById",
		        type: "GET",
		        dataType: "json",			        
		        data: {
		        	customerId:customerId
		        	},
		        success: function(data) {
		        	console.log("customerId = "+data);

		        },
		        error: function(jqXHR, textStatus, errorThrown) {
		            console.log("Lỗi: " + textStatus, errorThrown);
		        }
		});
	}
	
	 function doCreateCustomer(){
	        var customerName = $("#cre_name").val();
	        var email = $("#cre_email").val();
	        var telNum = $("#cre_phone").val();
	        var address = $("#cre_address").val();
	        var booleanActive = $("#booleanActive").is(":checked") ? true : false;

	        // Tạo đối tượng dữ liệu để gửi đi
	        var customerData = {
	        	customerName: customerName,
	            email: email,
	            telNum: telNum,
	            address: address,
	            booleanActive: booleanActive,	            
	        }
	        // Gửi yêu cầu AJAX để tạo người dùng
	        $.ajax({
	            type: "POST",
	            url: "http://localhost:8080/struts2-mybatis-login/customer/createCustomer",
	            data: customerData,
	            success: function(data) {
	                console.log("User created successfully: ", data);
	                // Thực hiện các hành động bổ sung sau khi tạo người dùng thành 
	                $("#allCustomer tbody").html('');
	              
	                loadAllCustomer();
	                $("#modal-create-customer").modal("hide");		                
	               
	                $("#frmCreateCustomer")[0].reset();
	            },
	            error: function(xhr, status, error) {
	                console.log("Error creating user:", error);
	                // Xử lý lỗi nếu có
	            }
	      });
}
		  
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
	 
	 
	 
	 function renderCustomer(customer) {
		 var isActive = customer.isActive == 1 ? "Đang hoạt động" : "Tạm khóa";
		    var row = "<tr>" +
		        "<td>" + customer.customerId + "</td>" +
		        "<td>" + customer.customerName + "</td>" +
		        "<td>" + customer.email + "</td>" +
		        "<td>" + customer.address + "</td>" +
		        "<td>" + customer.telNum + "</td>" +
		        "<td class='d-flex justify-content-between'>" +
		        "<div>" +
		        "<i onclick='showModalUpdateUser(" + customer.customerId + ")' class='fa-solid fa-pen btn btn-primary' style='cursor: pointer'></i>" +
		        "</div>" +
		        "</td>" +
		        "</tr>";

		    return  $("#allCustomer tbody").append(row);;
	}
	 
	 
	 function loadAllCustomer() {
		    $.ajax({
		        url: "http://localhost:8080/struts2-mybatis-login/customer/getAllCustomer",
		        type: "GET",
		        dataType: "json",
		        success: function(data) {
		        	console.log("data = " + data)
		        	 var customers = data;
		        	 DisplayList(customers, list_element, rows, current_page);
		        
	                 SetupPagination(customers, pagination_element, rows); 
	                   $.each(customers, function(index, customer) { 
	                	   
			            $("#allCustomer tbody").append(customer); 
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
	

	$("#frmCreateCustomer").validate(
			{
				rules : {
					customer_name : {
						required : true,
						minlength : 6,
						maxlength : 35
					},
					customer_email : {
						required : true,
						minlength : 9,
						maxlength : 35,
					},
					customer_phone : {	
						required : true,
						minlength : 6,
						maxlength : 35,
						
					},
					customer_address : {
						required : true,
						minlength : 6,
						maxlength : 35,
						
					}
				},
				messages : {
					customer_name : {
						required : "Vui lòng nhập tên đầy đủ",
						minlength : "Độ dài tối thiểu là 6 ký tự",
						maxlength : "Độ dài tối đa là 35 ký tự"
					},
					customer_email : {
						required : "Vui lòng nhập địa chỉ email!",
						minlength : "Độ dài tối thiểu là 9 ký tự",
						maxlength : "Độ dài tối đa là 35 ký tự",
						email: "Vui lòng nhập đúng định dạng email"
					},
					customer_phone : {
						required : "Vui lòng nhập mật khẩu!",
						minlength : "Độ dài tối thiểu là 6 ký tự",
						maxlength : "Độ dài tối đa là 35 ký tự",
						
					},
					customer_address : {
						required : "Vui lòng xác nhận mật khẩu!",
						minlength : "Độ dài tối thiểu là 6 ký tự",
						maxlength : "Độ dài tối đa là 35 ký tự",
						
					}
				},
				errorLabelContainer : "#modal-create-customer .modal-alert-danger",
				errorPlacement : function(error, element) {
					error.appendTo("#modal-create-customer .modal-alert-danger");
				},
				showErrors : function(errorMap, errorList) {
					if (this.numberOfInvalids() > 0) {
						$("#modal-create-customer .modal-alert-danger")
								.removeClass("hide").addClass("show");
					} else {
						$("#modal-create-customer .modal-alert-danger")
								.removeClass("show").addClass("hide").empty();
						$("#frmCreateCustomer input.error").removeClass("error");
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
					customer_name : {
						required : true,
						minlength : 6,
						maxlength : 35
					},
					customer_email : {
						required : true,
						minlength : 9,
						maxlength : 35,
					},
					customer_phone : {	
						required : true,
						minlength : 6,
						pwcheck : true,
						maxlength : 35,
					},
					customer_address : {
						required : true,
						minlength : 6,
						maxlength : 35,
						
					}
				},
				messages : {
					customer_name : {
						required : "Vui lòng nhập tên đầy đủ",
						minlength : "Độ dài tối thiểu là 6 ký tự",
						maxlength : "Độ dài tối đa là 35 ký tự"
					},
					customer_email : {
						required : "Vui lòng nhập địa chỉ email!",
						minlength : "Độ dài tối thiểu là 9 ký tự",
						maxlength : "Độ dài tối đa là 35 ký tự",
						email: "Vui lòng nhập đúng định dạng email"
					},
					customer_phone : {
						required : "Vui lòng nhập mật khẩu!",
						minlength : "Độ dài tối thiểu là 6 ký tự",
						maxlength : "Độ dài tối đa là 35 ký tự",
						pwcheck : "Mật khẩu phải có tối thiểu 1 chữ hoa, 1 chữ thường và một số!",
					},
					customer_address : {
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
		    $("#frmCreateCustomer").validate().resetForm();
		    // Xóa thông báo lỗi
		    $("#modal-create-customer .modal-alert-danger").removeClass("show").addClass("hide").empty();
		    // Xóa lớp error trên các trường input
		    $("#frmCreateCustomer input.error").removeClass("error");  
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