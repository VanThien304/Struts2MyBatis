<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Page Product</title>

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
					<a href="product">Products</a>
				</div>
				<div>
					<a href="customer">Customers</a>
				</div>
				<div>
					<a href="listUser">Users</a>
				</div>
			</div>
			<div class="col-4 d-flex justify-content-end">
				<a href="logout">Admin</a>
			</div>
		</div>
		<div>
			<h3>Product</h3>
		</div>
	</div>

	<hr class="p-1" style="color: lightgrey" />

	<div class="container pb-4">
		<div class="row">
			<div class="col-12 d-flex">
				<!-- 	<h3>Search By Name</h3> -->

				<div class="col-3" id="searchForm">
					<div>
						<h5>Title</h5>
					</div>
					<input type="search" name="keyword" id="keywordInput"
						placeholder="Input fullname" />
				</div>

				<div class="col-3">
					<div>
						<h5>isSales</h5>
					</div>
					<select name="isSales" id="selectSale"
						onchange="selectProductBySales(this.value)">
						<option selected>Select isSales</option>
						<option value="1">Đang bán</option>
						<option value="2">Tạm dừng</option>
						<option value="3">Hết hàng</option>
					</select>
				</div>

				<div class="col-3">
					<div class="d-flex justify-content-between">
						<h5>Price from</h5>
						<h5>Price to</h5>
					</div>
					<div></div>
					<div class="d-flex">

						<input type="text" id="priceFrom" name="priceFrom"
							pattern="[0-9]*" inputmode="numeric"> <input type="text"
							id="priceTo" name="priceTo" pattern="[0-9]*" inputmode="numeric">
						<input value="Submit" type="button" id="submitBtn" />

					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="container p-2">
		<div class="row">
			<div class="col-12 d-flex">
				<div class="col-4">
					<button type="button" id="show-modal-creproduct"
						class="btn btn-primary">Add Product</button>
				</div>

				<div class="col-4"></div>

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
		<table id="allProduct" class="table table-striped">

			<tbody>


			</tbody>

		</table>
	</div>

	<div id="modal-create-product" class="modal" tabindex="-1"
		style="display: none;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal Create Product</h5>
					<button type="button" class="btn-close close"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modal-alert-danger hide"></div>
					<form id="frmCreateProduct">
						<div class="form-row">
							<div class="col-sm-6">
								<div class="form-group p-2">
									<label for="name">Title:</label> <input class="form-control"
										type="text" name="productName" id="cre_productName" />
								</div>

								<div class="form-group p-2">
									<div>Price:</div>
									<input class="form-control" type="number" name="priceProduct"
										id="cre_priceProduct" />
								</div>

								<div class="form-group p-2">
									<div>Description:</div>
									<textarea class="form-control" name="description"
										id="cre_description" placeholder="Description product"></textarea>
								</div>

								<div class="form-group p-2 d-flex">
									<div>Sale:</div>
									<select name="isSales" id="cre_isSales"
										style="margin-left: 9px;">
										<option value="1" ${isSales == 1 ? 'selected' : ''}>Đang
											bán</option>
										<option value="2" ${isSales == 2 ? 'selected' : ''}>Tạm
											dừng</option>
										<option value="3" ${isSales == 3 ? 'selected' : ''}>Hết
											hàng</option>
									</select>

								</div>

							</div>
							<div class="col-sm-6">
								<div>IMG</div>
								<img src="">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" id="btnCreateProduct"
						class="btn btn-primary p-2">Create</button>
					<button type="button" class="btn btn-secondary p-2 close"
						id="btnCloseCreateProduct" data-bs-dismiss="modal">Close</button>
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

	loadAllProduct();

	const list_element = document.querySelector('#allProduct');
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
		let thead_row = "<tr>" + "<th>ID</th>" + "<th>Title</th>"
				+ "<th>Description</th>" + "<th>Price</th>"
				+ "<th>isSales</th>" + "<th>Action</th>" + "</tr>";
		thead_element.innerHTML = thead_row;
		table_element.appendChild(thead_element);

		let tbody_element = document.createElement('tbody');
		for (let i = 0; i < paginatedItems.length; i++) {
			let item = paginatedItems[i];

			var isSales = "";

			if (item.isSales == 1) {
				isSales = "Đang bán";
			} else if (item.isSales == 2) {
				isSales = "Ngừng bán";
			} else {
				isSales = "Hết hàng";
			}
			var productPrice = item.productPrice;
			var formattedPrice = productPrice.toLocaleString('en-US', {
				style : 'currency',
				currency : 'USD'
			});
			formattedPrice = formattedPrice.replace(/\.00$/, '');
			var row = "<tr>" + "<td>"
					+ item.productId
					+ "</td>"
					+ "<td>"
					+ item.productName
					+ "</td>"
					+ "<td>"
					+ item.description
					+ "</td>"
					+ "<td>"
					+ formattedPrice
					+ "</td>"
					+ "<td>"
					+ isSales
					+ "</td>"
					+ "<td class='d-flex justify-content-between'>"
					+ "<div>"
					+ "<i onclick='showModalUpdateUser("
					+ item.productId
					+ ")' class='fa-solid fa-pen btn btn-primary' style='cursor: pointer'></i>"
					+ "</div>"
					+ "<div>"
					+ "<a onclick='return confirmBox();' href='product/deleteProductById?productId="
					+ item.productId + "' class='delete'>"
					+ "<i class='fa-solid fa-trash btn btn-danger'></i>"
					+ "</a>" + "</div>" + "</td>" + "</tr>";
			tbody_element.innerHTML += row;
		}

		table_element.appendChild(tbody_element);
		wrapper.appendChild(table_element);
	}

	
	function SetupPagination(items, wrapper, rows_per_page) {
		wrapper.innerHTML = "";

		let page_count = Math.ceil(items.length / rows_per_page);
		for (let i = 1; i < page_count + 1; i++) {
			let btn = PaginationButton(i, items);
			wrapper.appendChild(btn);
		}
	}

	function PaginationButton(page, items) {
		let button = document.createElement('button');
		button.innerText = page;

		if (current_page == page)
			button.classList.add('active');

		button.addEventListener('click', function() {
			current_page = page;
			DisplayList(items, list_element, rows, current_page);

			let current_btn = document
					.querySelector('.pagenumbers button.active');
			current_btn.classList.remove('active');

			button.classList.add('active');
		});

		return button;
	}

	/*  	 DisplayList(list_items, list_element, rows, current_page);
	 SetupPagination(list_items, pagination_element, rows);   */
	 
	 function isValidNumber(value) {
	        return /^\d+$/.test(value);
	    }
	 
	
	 
	 $('#submitBtn').click(function() {
         var priceFrom = $('#priceFrom').val();
         var priceTo = $('#priceTo').val();

         
         priceFrom = parseInt(priceFrom);
         priceTo = parseInt(priceTo);
         if(priceFrom > priceTo){	
        	return alert("Số tiền nhập vào " + priceFrom + " phải nhỏ hơn hoặc bằng" + priceTo);	 
         }
         
         if (!isValidNumber(priceFrom) || !isValidNumber(priceTo)) {
             alert("Vui lòng chỉ nhập số trong các trường");
             document.getElementById("priceFrom").value = "";
             document.getElementById("priceTo").value = "";
             return;
         }
         
         var requestData = {
             priceFrom: priceFrom,
             priceTo: priceTo
         };
         $.ajax({
        	 url: "http://localhost:8080/struts2-mybatis-login/product/getProductByPrice",
		     type: "GET",
             data: requestData,
             dataType: 'json',
             success: function(data) {
                 // Xử lý dữ liệu trả về từ server
                 var products = data;
					DisplayList(products, list_element, rows, current_page);

					SetupPagination(products, pagination_element, rows);
					
					if(products.length === 0){
						 var noDataMessage = "<tr><td style='color: red;' colspan='6' class='text-center'>Giá tiền sản phẩm ngoài phạm vi tìm kiếm!</td></tr>";
		                     $("#allProduct tbody").append(noDataMessage);
					}
					$.each(products, function(index, product) {

						$("#allProduct tbody").append(product);
					});
             },
             error: function(jqXHR, textStatus, errorThrown) {
                 console.log('Error: ' + errorThrown);
             }
         });
     });
	 
	
	 $("#show-modal-creproduct").on('click',() => {
		 $("#modal-create-product").modal("show");		
	}); 
	 
	 $("#btnCreateProduct").on('click', () => {
		 $("#frmCreateProduct").submit();
	});
			
			
	$("#frmCreateProduct").submit(function(event) {
			    event.preventDefault();
			    if ($("#frmCreateProduct").valid()) {		        
			        doCreateProduct();
			    }
		});	 

	 function doCreateProduct(){
	        var productName = $("#cre_productName").val();
	        var description = $("#cre_description").val();
	        var productPrice = $("#cre_priceProduct").val();
	        var isSales = $("#cre_isSales").val();

	        // Tạo đối tượng dữ liệu để gửi đi
	        var productData = {
	        		productName: productName,
	        		description: description,
	        		productPrice: productPrice,
	        		isSales: isSales,	            
	        }
	        // Gửi yêu cầu AJAX để tạo người dùng
	        $.ajax({
	            type: "POST",
	            url: "http://localhost:8080/struts2-mybatis-login/product/createProduct",
	            data: productData,
	            success: function(data) {
	                console.log("User created successfully: ", data);
	                // Thực hiện các hành động bổ sung sau khi tạo người dùng thành 
	                $("#allProduct tbody").html('');
	              
	                loadAllProduct();
	                
	                $("#modal-create-product").modal("hide");		                
	               
	                 $("#frmCreateProduct")[0].reset(); 
	            },
	            error: function(xhr, status, error) {
	                console.log("Error creating user:", error);
	                // Xử lý lỗi nếu có
	            }
	      });
}

	 function selectProductBySales(isSales){
		 $.ajax({
		        url: "http://localhost:8080/struts2-mybatis-login/product/getProductBySale",
		        type: "GET",
		        dataType: "json",			        
		        data: {
		        	isSales: isSales
		        	},
		        success: function(data) {    			        	
		        	if (data !== null) {
		        		 $("#allProduct tbody").html('');
		        		
		        	for(var i = 0; i < data.length; i++){
			        	var product = data[i];	   
			        	
			        	var row = renderProduct(product);
			                $("#allProduct tbody").append(row);
		        		 }
		              } else {
		                displayError();
		              }
		        	 DisplayList(data, list_element, rows, current_page);
				        
	                 SetupPagination(data, pagination_element, rows); 
		        },
		        error: function(jqXHR, textStatus, errorThrown) {
		            console.log("Lỗi: " + textStatus, errorThrown);
		        }
		});
	 }
	 
	 
	function renderProduct(product) {
		var isSales = "";
		var productPrice = product.productPrice;
		var formattedPrice = productPrice.toLocaleString('en-US', {
			style : 'currency',
			currency : 'USD'
		});
		formattedPrice = formattedPrice.replace(/\.00$/, '');
		if (product.isSales == 1) {
			isSales = "Đang bán";
		} else if (product.isSales == 2) {
			isSales = "Ngừng bán";
		} else {
			isSales = "Hết hàng";
		}

		var row = "<tr>" + "<td>"
				+ product.productId
				+ "</td>"
				+ "<td>"
				+ product.productName
				+ "</td>"
				+ "<td>"
				+ product.description
				+ "</td>"
				+ "<td>"
				+ formattedPrice
				+ "</td>"
				+ "<td>"
				+ isSales
				+ "</td>"
				+ "<td class='d-flex justify-content-between'>"
				+ "<div>"
				+ "<i onclick='showModalUpdateUser("
				+ product.productId
				+ ")' class='fa-solid fa-pen btn btn-primary' style='cursor: pointer'></i>"
				+ "</div>" + "<div>"
				+ "<a onclick='return confirmBox();' href='product/deleteProductById?productId="
				+ product.productId + "' class='delete_product'>"
				+ "<i class='fa-solid fa-trash btn btn-danger'></i>" + "</a>"
				+ "</div>" + "</td>" + "</tr>";

		return $("#allProduct tbody").append(row);
		;
	}

	function loadAllProduct() {
		$
				.ajax({
					url : "http://localhost:8080/struts2-mybatis-login/product/getAllProduct",
					type : "GET",
					dataType : "json",
					success : function(data) {
						var products = data;
						DisplayList(products, list_element, rows, current_page);

						SetupPagination(products, pagination_element, rows);
						$.each(products, function(index, product) {

							$("#allProduct tbody").append(product);
						});

					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("Lỗi: " + textStatus, errorThrown);
					}
				});
	}

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
	

	 $("#frmCreateProduct")
			.validate(
					{
						rules : {
							productName : {
								required : true,
								minlength : 5,
								maxlength : 35
							},
							description : {
								required : true,
								minlength : 4,
								maxlength : 35,
							},
							priceProduct : {
								required : true,
								 number: true,
							     min: 0							
							},
						
						},
						messages : {
							productName : {
								required : "Tên sản phẩm không được để trống!",
								minlength : "Độ dài tối thiểu là 5 ký tự",
								maxlength : "Độ dài tối đa là 35 ký tự"
							},
							description : {
								 required: "Vui lòng nhập mô tả!",
							      minlength: "Độ dài mô tả tối thiểu là 4 ký tự",
							      maxlength: "Độ dài mô tả tối đa là 35 ký tự",
							},
							priceProduct : {
								required : "Giá bán không được nhỏ hơn 0",
								number: "Giá bán phải là một số",
							    min: "Giá bán không được nhỏ hơn 0",
								
							},
						
						},
						errorLabelContainer : "#modal-create-product .modal-alert-danger",
						errorPlacement : function(error, element) {
							error
									.appendTo("#modal-create-product .modal-alert-danger");
						},
						showErrors : function(errorMap, errorList) {
							if (this.numberOfInvalids() > 0) {
								$("#modal-create-product .modal-alert-danger")
										.removeClass("hide").addClass("show");
							} else {
								$("#modal-create-product .modal-alert-danger")
										.removeClass("show").addClass("hide")
										.empty();
								$("#frmCreateProduct input.error")
										.removeClass("error");
							}
							this.defaultShowErrors();
						},

					})

	
	$(".close").on(
			'click',
			function() {
				// Reset lại form
				$("#frmCreateProduct").validate().resetForm();
				// Xóa thông báo lỗi
				$("#modal-create-product .modal-alert-danger").removeClass("show")
						.addClass("hide").empty();
				// Xóa lớp error trên các trường input
				$("#frmCreateProduct input.error").removeClass("error");
				
				$("#frmCreateProduct")[0].reset(); 
			});
 

</script>
</html>