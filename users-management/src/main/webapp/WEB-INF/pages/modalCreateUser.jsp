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
<div id="modal-create-user" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
          <s:form class="" id="frmCreateUser">
                        <div class="form-row">

                            <div class="col-sm-12">
                                <div class="form-group "> 
                                    <s:textfield class="form-control" name="name" label="Fullname" id=""/>
                                </div>
                                <div class="form-group ">
                                     <s:textfield class="form-control" name="email" label="Email" id=""/>
                                </div>
                                <div class="form-group ">
                                	<s:password name="password" label="password"/>
                                </div>
                                 <div class="form-group ">
                                  <s:textfield class="form-control" name="group" label="Group" id=""/>
                                </div>
                                <div class="form-group ">
                                    <s:textfield class="form-control" name="active" label="Active" id=""/>
                     
                                </div>
                            </div>
                        </div>
                    </s:form>
                    
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save User</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>