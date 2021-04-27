<%-- 
    Document   : template
    Created on : Apr 8, 2021
    Author     : Scott Forsyth
--%>
<%@page import="javax.mail.FetchProfile.Item"%>
<%   
    if(session.getAttribute("UserName") == null){
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="WEB-INF/includes/head.jspf" %>
<c:out value="${Items }"></c:out>
<!-- Begin Page Content -->
<div class="container-fluid">    
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Item <%= request.getParameter("item") %> Details</h1>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Item Details</h6>
            <br />
            <div class="row">
                <div class="col-8">
                    <form action="">
                        <div class="form-group row">
                            <label for="itemSKU" class="col-4 col-form-label">Item SKU</label> 
                            <div class="col-8">
                                <input id="itemSKU" name="Item SKU" value="${itemSKU}" class="form-control here" required="required" type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="itemName" class="col-4 col-form-label">Item Name</label> 
                            <div class="col-8">
                                <input id="itemName" name="itemName" value="${itemName}" class="form-control here" type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="itemQTY" class="col-4 col-form-label">Quantity</label> 
                            <div class="col-8">
                                <input id="itemQTY" name="itemQTY" value="${itemQTY}" class="form-control here" type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="itemLOC" class="col-4 col-form-label">Item Location</label> 
                            <div class="col-8">
                                <input id="itemLOC" name="itemLOC" value="${itemLoc}" class="form-control here" type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="itemColor" class="col-4 col-form-label">Item Color</label> 
                            <div class="col-8">
                                <input id="itemColor" name="itemColor" value="${itemLoc}" class="form-control here" type="text">
                            </div>
                        </div>
                        
                        <%
                            Integer permLvl = (Integer) session.getAttribute("Role");
                            if(permLvl >= 2){
                                
                        %>
                        
                        <div class="form-group row">
                            <div class="offset-4 col-8">
                                <button name="submit" type="submit" class="btn btn-primary">Update Item</button>
                            </div>
                        </div>
                        
                        <% } %>
                        
                    </form>
		</div>
            </div>
        </div>
    </div>
    
    
</div>
<%@include file="WEB-INF/includes/footer.jspf" %>