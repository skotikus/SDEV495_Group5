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
            <h6 class="m-0 font-weight-bold text-primary">Search Locations</h6>
            <div class="row">
                <form action="Locations" class="form-group input-group" method="post">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fas fa-hashtag"></i> </span>
                    </div>
                    <input name="locID" class="form-control" placeholder="ID" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fas fa-font"></i> </span>
                    </div>
                    <input name="locName" class="form-control" placeholder="Name" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fas fa-road"></i> </span>
                    </div>
                    <input name="locStreet" class="form-control" placeholder="Street" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="fas fa-city"></i> </span>
                    </div>
                    <input name="locCity" class="form-control" placeholder="City" type="text">
                    <div class="input-group-prepend">
                        <span class="input-group-text"> <i class="far fa-envelope"></i> </span>
                    </div>
                    <input name="locZip" class="form-control" placeholder="Zip Code" type="text">
                    <button name="getLocs" type="submit" class="btn btn-primary">Search</button>
                </form><!-- form-group// -->
            </div>
            <div class="card-body">
                <div class="table-responsive" id="itemTable">
                    ${locTable}
                </div>
            </div>
	</div>
    </div>
</div>
<%@include file="WEB-INF/includes/footer.jspf" %>