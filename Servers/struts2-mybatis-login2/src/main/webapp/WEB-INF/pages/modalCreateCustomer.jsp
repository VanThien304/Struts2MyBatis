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
	<div id="modal-update-customer" class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Modal Update Customer</h5>
					<button type="button" class="btn-close close"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="modal-alert-danger hide"></div>
					<form id="frmUpdateCustomer">
						<tr>
							<td><input class="form-control" type="text" id="cus_id" /></td>
							<td><input class="form-control" type="text" id="cus_name" /></td>
							<td><input class="form-control" type="text" id="cus_email" /></td>
							<td><input class="form-control" type="text" id="cus_address" /></td>
							<td><input class="form-control" type="text" id="cus_phone" /></td>
						</tr>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnUpdateUser">Update</button>
					<button type="button" class="btn btn-secondary close"
						id="btnCloseUpdateUser" data-bs-dismiss="modal">Close</button>

				</div>
			</div>
		</div>
	</div>
</body>
</html>