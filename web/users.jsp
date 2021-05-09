<%-- 
    Document   : template
    Created on : Apr 8, 2021
    Author     : Scott Forsyth
--%>
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
    if("deleted".equals(result)){      
%>

<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong>Success!</strong> The user has been ${completed}
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<% 
    }
else if("error".equals(result)){
%>

<div class="alert alert-danger alert-dismissible fade show" role="alert">
  <strong>ERROR:</strong> ${errorMessage}.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>

<% 
    }
%>

<!-- Begin Page Content -->
<div class="container-fluid">
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <%
                //check permission to display admin level page items
                Integer permLvl = (Integer) session.getAttribute("Role");
                if(permLvl >= 2){
            %>
            <div class="form-group row">
                <a class="btn btn-primary" href="user.jsp?action=new" role="button">Create New User</a>
            </div>
            <% } %>
        </div>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Search Users</h6>
            <div class="row">
                <form action="Users" class="form-group input-group" method="post">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fas fa-hashtag"></i> </span>
                    </div>
                    <input name="formUID" class="form-control" placeholder="ID" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fas fa-font"></i> </span>
                    </div>
                    <input name="formUN" class="form-control" placeholder="Userame" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fas fa-font"></i> </span>
                    </div>
                    <input name="formFirst" class="form-control" placeholder="First" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fas fa-font"></i> </span>
                    </div>
                    <input name="formLast" class="form-control" placeholder="Last" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="far fa-envelope"></i> </span>
                    </div>
                        <input name="formEmail" class="form-control" placeholder="Email" type="text">
                        <button action="Users" name="getUsers" type="submit" class="btn btn-primary">Search</button>
                </form><!-- form-group// -->
            </div>
            <div class="card-body">
                <div class="table-responsive" id="userTable">
                    ${userTable}
                </div>
            </div>
	</div>
    </div>
</div>
<%@include file="WEB-INF/includes/footer.jspf" %>