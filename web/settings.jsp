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
        <h1 class="h3 mb-0 text-gray-800">Application Settings</h1>
    </div>
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Database Reset</h6>
            <br />
            <div class="row">
                <img src="img/oops.jpg">
                <p>If you're reading this then something terrible has happened and you need to cover your tracks</p>
                <p>Press this button to reset the Database back to Demo Data</p>
                <br />
                <p>All passwords will be reset to "TestPass"</p>
            </div>
            <div class="row">
                <button data-toggle="modal" data-target="#ResetModal" class="btn btn-outline-danger">Reset Database</button> 
            </div>
        </div>
    </div>
    
    
</div>
<!-- Logout Modal-->
    <div class="modal fade" id="ResetModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Sure you want to reset the Database?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Clicking reset will reset the database to default demo data. All passwords will be reset to "TestPass".</div>
                <div class="modal-footer">
                    <form action="Settings" method="post">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <button class="btn btn-outline-danger" type="submit" name="reset">Reset</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
<%@include file="WEB-INF/includes/footer.jspf" %>