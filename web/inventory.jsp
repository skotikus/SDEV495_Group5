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
	<div class="card shadow mb-4">
            <div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">Search Items</h6>
            <div class="row">
                <form action="Items" class="form-group input-group" method="post">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="itemSKU" class="form-control" placeholder="SKU" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="itemName" class="form-control" placeholder="Name" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="itemQTY" class="form-control" placeholder="QTY" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="itemLOC" class="form-control" placeholder="Location" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                    </div>
                    <input name="itemColor" class="form-control" placeholder="Color" type="text">
                    <button action="Items" name="getItems" type="submit" class="btn btn-primary">Search</button>
                </form><!-- form-group// -->
            </div>
		<div class="card-body">
			<div class="table-responsive" id="itemTable">
				${itemTable}
			</div>
		</div>
	</div>
</div>
<%@include file="WEB-INF/includes/footer.jspf" %>