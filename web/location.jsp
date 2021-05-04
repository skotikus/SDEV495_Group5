<%-- 
    Document   : template
    Created on : May 2, 2021
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
  <strong>Success!</strong> The location has been ${completed}.
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

    //check if this is a new location form
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
        <h1 class="h3 mb-0 text-gray-800"><% if(!newy){ %>${locName}<% }else{ %>New Location<%}%> Details</h1>
    </div>
     
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Location Details</h6>
            <br />
            <div class="row">
                <div class="col-8">
                    <form action="Locations" method="post">
                        
                        <div class="form-group row">
                            <label for="locID" class="col-4 col-form-label">Location ID</label> 
                            <div class="col-8">
                                <input id="locID" name="locID" value="${locID}" class="form-control here" <% if(!newy){ %>readonly<% }else{ %>required<%}%> type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="locName" class="col-4 col-form-label">Location Name</label> 
                            <div class="col-8">
                                <input id="locName" name="locName" value="${locName}" class="form-control here" type="text" <% if(newy){ %>required<%}%>>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="locStreet" class="col-4 col-form-label">Street Addr</label> 
                            <div class="col-8">
                                <input id="locStreet" name="locStreet" value="${locStreet}" class="form-control here" type="text" <% if(newy){ %>required<%}%>>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="locCity" class="col-4 col-form-label">City</label> 
                            <div class="col-8">
                                <input id="locCity" name="locCity" value="${locCity}" class="form-control here" type="text" <% if(newy){ %>required<%}%>>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="locState" class="col-4 col-form-label">State</label> 
                            <div class="col-8">
                                <input id="locState" name="locState" value="${locState}" class="form-control here" type="text" <% if(newy){ %>required<%}%>>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="locZip" class="col-4 col-form-label">Zip Code</label> 
                            <div class="col-8">
                                <input id="locZip" name="locZip" value="${locZip}" class="form-control here" type="text" <% if(newy){ %>required<%}%>>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="locCap" class="col-4 col-form-label">Capacity</label> 
                            <div class="col-8">
                                <input id="locCap" name="locCap" value="${locCap}" class="form-control here" type="text" <% if(newy){ %>required<%}%>>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="offset-4 col-8">
                        <%
                            //check permission to display admin level page items
                            Integer permLvl = (Integer) session.getAttribute("Role");
                            if(permLvl >= 2 && !newy){
                        %>
                        
                                <button name="update" type="submit" class="btn btn-primary">Update Location</button>
                                <button name="delete" type="submit" class="btn btn-outline-danger">Delete Location</button>                      
                        <% } else if(permLvl >= 2) { %>
                            <button name="create" type="submit" class="btn btn-outline-primary">Create Location</button>
                        <%}else{%>
                            <button type="button" class="btn btn-primary" onclick="goBack()">Back to Locations</button>
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