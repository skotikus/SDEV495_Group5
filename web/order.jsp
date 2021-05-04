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
<div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Work Order # ${orderID} Details</h1>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Work Order Details</h6>
            <br />
            <div class="row">
                <div class="col-8">
                    <form action="">
                        <div class="form-group row">
                            <label for="orderID" class="col-4 col-form-label">Order #</label> 
                            <div class="col-8">
                                <input id="orderID" name="orderID" value="${orderID}" class="form-control here" readonly required="required" type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="impDate" class="col-4 col-form-label">Fill Date</label> 
                            <div class="col-8">
                                <input id="impDate" name="impDate" value="${impDate}" class="form-control here" type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="compDate" class="col-4 col-form-label">Completed Date</label> 
                            <div class="col-8">
                                <input id="compDate" name="compDate" value="${compDate}" class="form-control here" type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="srcLoc" class="col-4 col-form-label">Source Location</label> 
                            <div class="col-8">
                                <input id="srcLoc" name="srcLoc" value="${srcLoc}" class="form-control here" type="text">
                            </div>
                        </div>
                            <div class="form-group row">
                            <label for="destLoc" class="col-4 col-form-label">Destination Location</label> 
                            <div class="col-8">
                                <input id="destLoc" name="destLoc" value="${destLoc}" class="form-control here" type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="itemName" class="col-4 col-form-label">Item Name</label> 
                            <div class="col-8">
                                <input id="itemName" name="itemName" value="${itemName}" class="form-control here" type="text">
                            </div>
                        </div>
                            <div class="form-group row">
                            <label for="orderQTY" class="col-4 col-form-label">Order QTY</label> 
                            <div class="col-8">
                                <input id="orderQTY" name="orderQTY" value="${orderQTY}" class="form-control here" type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="userName" class="col-4 col-form-label">User Name</label> 
                            <div class="col-8">
                                <input id="userName" name="userName" value="${userName}" class="form-control here" type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="offset-4 col-8">
                        <%
                            Integer permLvl = (Integer) session.getAttribute("Role");
                            if(permLvl >= 2){
                                
                        %>
                                <button name="update" type="submit" class="btn btn-primary">Update Order</button>
                        <% } %>
                        <button name="execute" type="submit" class="btn btn-primary">Execute Order</button>
                            </div>
                        </div>
                        
                    </form>
		</div>
            </div>
        </div>
    </div>
</div>
<%@include file="WEB-INF/includes/footer.jspf" %>