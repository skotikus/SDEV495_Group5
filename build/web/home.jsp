<%-- 
    Document   : template
    Created on : Apr 8, 2021
    Author     : Scott Forsyth
--%>
<%   
    if(session.getAttribute("UserEmail") == null){
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="WEB-INF/includes/head.jspf" %>
<!-- Begin Page Content -->
<div class="container-fluid">    

    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
    </div>    
    
    
</div>
<%@include file="WEB-INF/includes/footer.jspf" %>