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
    if("updated".equals(result) || "created".equals(result)){      
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong>Success!</strong> Your item has been ${completed}.
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
        <h1 class="h3 mb-0 text-gray-800"><% if(!newy){ %>${item}<% }else{ %>New Item<%}%> Details</h1>
    </div>
     
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Item Details</h6>
            <br />
            <div class="row">
                <div class="col-8">
                    <form action="Items" method="post">
                        <div class="form-group row">
                            <label for="itemSKU" class="col-4 col-form-label">Item SKU</label> 
                            <div class="col-8">
                                <input id="itemSKU" name="itemSKU" value="${itemSKU}" class="form-control here" <% if(!newy){ %>readonly<% }else{ %>required<%}%> type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="itemName" class="col-4 col-form-label">Item Name</label> 
                            <div class="col-8">
                                <input id="itemName" name="itemName" value="${itemName}" class="form-control here" type="text" <% if(newy){ %>required<%}%>>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="itemQTY" class="col-4 col-form-label">Quantity</label> 
                            <div class="col-8">
                                <input id="itemQTY" name="itemQTY" value="${itemQTY}" class="form-control here" type="text" <% if(newy){%>required<%}%>>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="itemLOC" class="col-4 col-form-label">Item Location</label> 
                            <div class="col-8">
                                <input id="itemLOC" name="itemLOC" value="${itemLoc}" class="form-control here" type="text" <% if(newy){ %>required<%}%>>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="itemColor" class="col-4 col-form-label">Item Color</label> 
                            <div class="col-8">
                                <input id="itemColor" name="itemColor" value="${itemColor}" class="form-control here" type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="offset-4 col-8">
                        <%
                            //check permission to display admin level page items
                            Integer permLvl = (Integer) session.getAttribute("Role");
                            if(permLvl >= 2 && !newy){
                        %>
                        
                                <button name="update" type="submit" class="btn btn-primary">Update Item</button>
                                <button name="delete" type="submit" class="btn btn-outline-danger">Delete Item</button>                      
                        <% } else if(permLvl >= 2) { %>
                            <button name="create" type="submit" class="btn btn-primary">Create Item</button>
                        <%}else{%>
                            <button type="button" class="btn btn-primary" onclick="goBack()">Back to Inventory</button>
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