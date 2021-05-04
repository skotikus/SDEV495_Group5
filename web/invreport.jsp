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
        <h1 class="h3 mb-0 text-gray-800">Inventory Report</h1>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Items by Location</h6>
        </div>
        <div class="card-body">
            <div class="chart-pie pt-4">
                <canvas id="myPieChart"></canvas>
            </div>
            <hr>
                Inventory by location
                more info <a href="https://www.chartjs.org/docs/latest/samples/other-charts/doughnut.html">here</a>
            </div>
    </div>
</div>
<%@include file="WEB-INF/includes/footer.jspf" %>