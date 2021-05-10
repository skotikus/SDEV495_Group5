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
  <strong>Success!</strong> The order has been ${completed}.
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

<!-- Begin Page Content -->
<div class="container-fluid">    
<!-- DataTables Example -->
	<div class="card shadow mb-4">
            <div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">Work Orders</h6>
            <div class="row">
                <form action="Orders" class="form-group input-group" method="post">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fas fa-hashtag"></i> </span>
                    </div>
                    <input name="orderID" class="form-control" placeholder="Order #" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fas fa-building"></i> </span>
                    </div>
                    <input name="srcLoc" class="form-control" placeholder="Src Location" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="far fa-building"></i> </span>
                    </div>
                    <input name="destLoc" class="form-control" placeholder="Dest Location" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fas fa-cubes"></i> </span>
                    </div>
                    <input name="itemName" class="form-control" placeholder="Item" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="userName" class="form-control" placeholder="Worker" type="text">
                    <button name="listOrders" type="submit" class="btn btn-primary">Search</button>
                </form><!-- form-group// -->
            </div>
		<div class="card-body">
			<div class="table-responsive" id="ordersTable">
				${ordersTable}
			</div>
		</div>
	</div>
    
    
</div>
<%@include file="WEB-INF/includes/footer.jspf" %>