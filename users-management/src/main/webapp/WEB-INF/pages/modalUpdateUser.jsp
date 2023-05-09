<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<s:set var="user">
		${param.user}
	</s:set>

	 <i onclick="showModalUpdateUser()" class="fa-solid fa-pen" style="cursor: pointer"></i> 
	<div id="modal-update-user" class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal Update User</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<s:form id="update-form">

						<div class="form-row">
							<div class="col-sm-12">
								<div class="form-group ">
									<s:textfield name="id" label="ID" value="%{id}" />
								</div>
								<div class="form-group ">
									<s:textfield class="form-control" name="name" value="%{name}"
										label="FullName" />
								</div>
								<div class="form-group ">
									<s:textfield class="form-control" name="email" value="%{email}"
										label="Email" />
								</div>
								<div class="form-group ">
									<s:password class="form-control" name="password"
										value="%{password}" label="Password" />
								</div>
								<div class="form-group ">
									<s:password class="form-control" name="confirmPassword"
										value="%{confirmPassword}" label="Confirm Password" />
								</div>
								<div class="form-group ">
									<s:textfield class="form-control" name="groupRole"
										value="%{groupRole}" label="Group" />
								</div>
								<div class="form-group ">
									<s:textfield class="form-control" value="true" name="isActive"
										label="Active" readonly="true" />
								</div>
							</div>
						</div>
						
						<s:submit value="Save User" class="btn btn-primary" />

					</s:form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">

		function showModalUpdateUser() {
			$("#modal-update-user").modal("show");
			doUpdateUser();
		}

		function doUpdateUser() {
			$("#update-form").submit(function(e) {
				 e.preventDefault(); 
				var formData = $(this).serialize();
				$.ajax({
					url : "updateUser.action",
					type : "POST",
					data : formData,
					success : function(data) {
						console.log(data);

						location.reload();
						getAllUser();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(textStatus, errorThrown);

					}
				});
			});
		}
	</script>
</body>
</html>