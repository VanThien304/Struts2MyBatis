<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<s:set var="user">
		${param.user}
	</s:set>

	<div id="modal-update-user" class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal Update User</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modal-alert-danger hide"></div>
					<form id="frmUpdate">

						<div class="form-row">
							<div class="col-sm-12">
								<div class="form-group ">
									<label for="name">Name:</label> 
									<input class="form-control" type="text" name="name" id="upName" />
								</div>
								<div class="form-group ">
								<label for="email">Email:</label> 
									<input class="form-control" type="email" name="email"
										id="upEmail" />
								</div>
								<div class="form-group ">
									<label for="password">Password:</label>
									<input class="form-control" type="password" name="password"
										id="upPassword" />
								</div>
								<div class="form-group ">
									<label for="comfilmPassword">ConfirmPassword:</label>
									<input class="form-control" type="password"
										name="confirmPassword" id="upComPassword" />
								</div>
							
								<div class="form-group d-flex">
									<label for="groupRole">GroupRole:</label>
									<select name="groupRole" id="upGroupRole"
										style="margin-left: 9px;">
										<option value="1" ${groupRole == 1 ? 'selected' : ''}>Admin</option>
										<option value="2" ${groupRole == 2 ? 'selected' : ''}>Editor</option>
										<option value="3" ${groupRole == 3 ? 'selected' : ''}>Reviewer</option>
									</select>
								</div>
								<div class="form-group ">
									<label for="booleanActive">Active:</label> 
									<input type="checkbox" id="booleanActive" name="booleanActive"
										value="true" />
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal" id="btnUpdateUser">Update</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>