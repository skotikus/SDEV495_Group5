<%-- 
    Document   : template
    Created on : Apr 8, 2021
    Author     : Scott Forsyth
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   
    if(session.getAttribute("UserName") == null){
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="WEB-INF/includes/head.jspf" %>
<!-- Begin Page Content -->
<%
    String result = (String) request.getAttribute("completed");
    if("updated".equals(result) || "created".equals(result)){      
%>

<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong>Success!</strong> The user has been ${completed}.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<% 
    }
else if("error".equals(result)){
%>

<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong>ERROR:</strong> ${errorMessage}
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<% 
    }
%>
<div class="container-fluid">    
    <div class="d-sm-flex align-items-center justify-content-between mb-10">
        <h1 class="h3 mb-0 text-gray-800">User Profile</h1>
    </div>
     
    <div class="card shadow mb-10">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">User Information</h6>
            <br />
            <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-title mb-4">
                            <div class="d-flex justify-content-start">
                                <div class="image-container">
                                    <img src="img/unnamed.png" id="imgProfile" style="width: 150px; height: 150px" class="img-thumbnail" />
                                    <div class="middle">
                                        <input type="button" class="btn btn-secondary" id="btnChangePicture" value="Change" />
                                        <input type="file" style="display: none;" id="profilePicture" name="file" />
                                    </div>
                                </div>
                                <div class="userData ml-3">
                                    <h2 class="d-block" style="font-size: 1.5rem; font-weight: bold">${firstName} ${lastName}</h2>
                                    <p>User Role: ${roleName}</p>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-10">
		                <form action="Users" method="post">
                                    <div class="form-group row">
                                      <label for="formUN" class="col-4 col-form-label">User Name*</label> 
                                      <div class="col-8">
                                        <input id="formUN" name="formUN" value="${userName}" class="form-control here" required="required" type="text">
                                      </div>
                                    </div>
                                    <div class="form-group row">
                                      <label for="formFirst" class="col-4 col-form-label">First Name</label> 
                                      <div class="col-8">
                                        <input id="formFirst" name="formFirst" value="${firstName}" class="form-control here" type="text">
                                      </div>
                                    </div>
                                    <div class="form-group row">
                                      <label for="formLast" class="col-4 col-form-label">Last Name</label> 
                                      <div class="col-8">
                                        <input id="formLast" name="formLast" value="${lastName}" class="form-control here" type="text">
                                      </div>
                                    </div>
                                    <div class="form-group row">
                                      <label for="select" class="col-4 col-form-label">User Role</label> 
                                      <div class="col-8">
                                        <select id="select" name="formRole" class="custom-select">                                    
                                            <option value="${roleName}" selected>${roleName}</option>
                                            <c:forEach var="role" items="${dropRoles}">
                                                <c:if test="${role != roleName}">
                                                    <option value="<c:out value="${role}"/>"><c:out value="${role}"/></option> 
                                                </c:if>
                                            </c:forEach>           
                                        </select>
                                      </div>
                                    </div>
                                    <div class="form-group row">
                                      <label for="formEmail" class="col-4 col-form-label">Email*</label> 
                                      <div class="col-8">
                                        <input id="formEmail" name="formEmail" value="${userEmail}" class="form-control here" required="required" type="text">
                                      </div>
                                    </div>
                                    <div class="form-group row">
                                      <label for="newpass" class="col-4 col-form-label">New Password</label> 
                                      <div class="col-8">
                                        <input id="newpass" name="newpass" placeholder="New Password" class="form-control here" type="password">
                                      </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="newpassconf" class="col-4 col-form-label">Confirm New Password</label> 
                                        <div class="col-8">
                                            <input id="newpassconf" name="newpassconf" placeholder="Confirm New Password" class="form-control here" type="password">
                                        </div>
                                    </div> 
                                    <div class="form-group row">
                                      <div class="offset-4 col-8">
                                        <button name="profileupdate" type="submit" class="btn btn-primary">Update My Profile</button>
                                      </div>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    
</div>
<%@include file="WEB-INF/includes/footer.jspf" %>