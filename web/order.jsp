<%--
    Document   : orders
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
  <strong>Success!</strong> Your order has been ${completed}.
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
        <h1 class="h3 mb-0 text-gray-800"><% if(!newy){ %>Work Order # ${orderID}<% }else{ %>New Work Order<%}%> Details</h1>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Work Order Details</h6>
            <br />
            <div class="row">
                <div class="col-8">
                    <form action="Orders" method="post">
                        <div class="form-group row">
                            <label for="orderID" class="col-4 col-form-label">Order #</label>
                            <div class="col-8">
                                <input id="orderID" name="orderID" value="${orderID}" class="form-control here" <% if(!newy){ %>readonly<% }else{ %>required<%}%> type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="impDate" class="col-4 col-form-label">Fill Date</label> 
                            <div class="col-8">
                                <input id="impDate" name="impDate" value="${impDate}" class="form-control here" required type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="status" class="col-4 col-form-label">Order Closed</label> 
                            <div class="col-8">
                                <input id="status" name="status" class="form-control here" type="checkbox" value="<c:if test="${orderStatus == 0}">false</c:if>" <c:if test="${orderStatus == 0}">checked</c:if>>
                                <center><label for="status">*Only Checked by execution</label></center>
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
                                <select id="srcLoc" name="srcLoc" class="custom-select">
                                    <c:forEach var="location" items="${dropLocs}" varStatus="loop">
                                        <c:if test="${location == srcLoc}">
                                            <c:set var="srcLocIndex" value="${loop.index}"/>
                                        </c:if>
                                        <c:if test="${location != srcLoc}">
                                            <option value="<c:out value="${loop.index + 1}"/>"><c:out value="${location}"/></option> 
                                        </c:if>
                                    </c:forEach>
                                    <option value="${srcLocIndex + 1}" selected>${srcLoc}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="destLoc" class="col-4 col-form-label">Destination Location</label> 
                            <div class="col-8">
                                <select id="destLoc" name="destLoc" class="custom-select">
                                    <c:forEach var="location" items="${dropLocs}" varStatus="loop">
                                        <c:if test="${location == destLoc}">
                                            <c:set var="destLocIndex" value="${loop.index}"/>
                                        </c:if>
                                        <c:if test="${location != destLoc}">
                                            <option value="<c:out value="${loop.index + 1}"/>"><c:out value="${location}"/></option> 
                                        </c:if>
                                    </c:forEach>
                                    <option value="${destLocIndex + 1}" selected>${destLoc}</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="itemName" class="col-4 col-form-label">Item <% if(!newy){ %>Name<% }else{ %>ID<%}%></label> 
                            <div class="col-8">
                                <input id="itemName" name="itemName" value="${itemName}" class="form-control here" <% if(newy){ %>required<%}else{%>readonly<% } %> type="text">
                            </div>
                        </div>
                            <div class="form-group row">
                            <label for="orderQTY" class="col-4 col-form-label">Order QTY</label> 
                            <div class="col-8">
                                <input id="orderQTY" name="orderQTY" value="${orderQTY}" class="form-control here" required type="text">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="userName" class="col-4 col-form-label">User Name</label> 
                            <div class="col-8">
                                <select id="userName" name="userName" class="custom-select">
                                    <option value="${userName}" selected>${userName}</option>
                                    <c:forEach var="user" items="${dropUsers}">
                                        <c:if test="${user != userName}">
                                            <option value="<c:out value="${user}"/>"><c:out value="${user}"/></option> 
                                        </c:if>
                                    </c:forEach>           
                                </select>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="offset-4 col-8">
                                <button name="execute" type="submit" class="btn btn-success">Execute Order</button>
                        <%
                            //check permission to display admin level page items
                            Integer permLvl = (Integer) session.getAttribute("Role");
                            if(permLvl >= 2 && !newy){
                        %>
                        
                            <button name="update" type="submit" class="btn btn-primary">Update Order</button>
                            <button name="delete" type="submit" class="btn btn-outline-danger">Delete Order</button>                      
                        <% } else if(permLvl >= 2) { %>
                            <button name="create" type="submit" class="btn btn-primary">Create Order</button>
                        <%}else{%>
                            <button type="button" class="btn btn-primary" onclick="goBack()">Back to Orders</button>
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