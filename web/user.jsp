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
  <strong>ERROR:</strong> Action was not processed.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<% 
    }
%>
<%
    String action = request.getParameter("action");
    Boolean newy = null;
    if("new".equals(action)){
        newy = true;
    }else{
        newy = false;
    }
%>

<!-- Begin Page Content -->
<div class="container-fluid">    
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800"><% if(!newy){ %> ${firstName} ${lastName} <% }else{ %>New User<%}%> Details</h1>
    </div>
     
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">User Details</h6>
            <br />
            <div class="row">
                <div class="col-8">
                    <form action="Users" method="post">
                        <div class="form-group row">
                            <label for="formUID" class="col-4 col-form-label">User ID</label> 
                            <div class="col-8">
                                <input id="formUID" name="formUID" value="${userID}" class="form-control here" <% if(!newy){ %>readonly<% }else{ %>required<%}%> type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="formUN" class="col-4 col-form-label">Username</label> 
                            <div class="col-8">
                                <input id="formUN" name="formUN" value="${userName}" class="form-control here" type="text" <% if(newy){ %>required<%}%>>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="formFirst" class="col-4 col-form-label">First Name</label> 
                            <div class="col-8">
                                <input id="formFirst" name="formFirst" value="${firstName}" class="form-control here" type="text" <% if(newy){%>required<%}%>>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="formLast" class="col-4 col-form-label">Last Name</label> 
                            <div class="col-8">
                                <input id="formLast" name="formLast" value="${lastName}" class="form-control here" type="text" <% if(newy){ %>required<%}%>>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="formEmail" class="col-4 col-form-label">Email</label> 
                            <div class="col-8">
                                <input id="formEmail" name="formEmail" value="${userEmail}" class="form-control here" type="text">
                            </div>
                        </div>
                        <%
                            //check permission to display admin level page items
                            Integer permLvl = (Integer) session.getAttribute("Role");
                            if(permLvl >= 2 && !newy){
                        %>
                        <div class="form-group row">
                                <label for="formRole" class="col-4 col-form-label">Role</label> 
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
                            <div class="offset-4 col-8">
                                <button name="update" type="submit" class="btn btn-primary">Update User</button>
                                <button name="delete" type="submit" class="btn btn-outline-danger">Delete User</button>                      
                        <% } else if(permLvl >= 2) { %>
                            <div class="form-group row">
                                <div class="offset-4 col-8">
                                    <button name="create" type="submit" class="btn btn-primary">Create User</button>
                        <%}else{%>
                            <div class="form-group row">
                                <div class="offset-4 col-8">
                                    <button type="button" class="btn btn-primary" onclick="goBack()">Back to User List</button>
                            <script>
                                function goBack() {
                                  history.back();
                                }
                            </script>
                        <%}%>
                            </div>
                        </div>
                        
                    </form>
		</div>
            </div>
        </div>
    </div>
    
    
</div>
<%@include file="WEB-INF/includes/footer.jspf" %>