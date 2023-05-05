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
	<div id="modal-update-user" class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<s:form action="updateUser" class="" id="frmUpdateUser">

						<div class="form-row">

							<div class="col-sm-12">
								<div class="form-group ">
									<s:textfield class="form-control" name="name"
										label="Fullname" id="" />
								</div>
								<div class="form-group ">
									<s:textfield class="form-control" name="email" label="Email"
										id="" />
								</div>
								<div class="form-group ">
									<s:password class="form-control" name="password" label="Password" />
								</div>
								<div class="form-group ">
									<s:textfield class="form-control" name="groupRole"
										label="Group" id="" />
								</div>
								<div class="form-group ">
									<s:textfield class="form-control" value="true"  name="isActive"
										label="Active" readonly="true"/>
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
</body>
</html>