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
<!-- Begin Page Content -->
<div class="container-fluid">    
<!-- DataTales Example -->
	<div class="card shadow mb-4">
            <div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">Work Orders</h6>
            <div class="row">
                <form action="Orders" class="form-group input-group" method="post">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="orderID" class="form-control" placeholder="Order #" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="srcLocation" class="form-control" placeholder="Src Location" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="destLocation" class="form-control" placeholder="Dest Location" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="itemName" class="form-control" placeholder="Item" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="qty" class="form-control" placeholder="Qty" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="emp" class="form-control" placeholder="Emp. Assigned" type="text">
                    <button action="Orders" type="submit" class="btn btn-primary">Search</button>
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