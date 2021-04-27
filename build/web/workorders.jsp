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
<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">Work Orders</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive table-hover">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
                                            <tr>
						<th>Order #</th>
                                                <th>Fill Date</th>
						<th>Src Location</th>
                                                <th>Dest Location</th>
						<th>Item</th>
						<th>Qty</th>
						<th>Emp. Assigned</th>
                                            </tr>
					</thead>
					<tfoot>
						<tr>
                                                    <th>Order #</th>
                                                    <th>Fill Date</th>
                                                    <th>Src Location</th>
                                                    <th>Dest Location</th>
                                                    <th>Item</th>
                                                    <th>Qty</th>
                                                    <th>Emp. Assigned</th>
						</tr>
					</tfoot>
					<tbody>
						<tr onclick="window.location='order.jsp'">
							<td>789</td>
							<td>3/20/2020</td>
							<td>Warehouse 1</td>
							<td>Annex</td>
							<td>Shiny Item 14</td>
							<td>50</td>
                                                        <td>Garrett Winters</td>
						</tr>
						<tr onclick="window.location='order.jsp'">
							<td>795</td>
							<td>1/22/2020</td>
							<td>Warehouse 2</td>
							<td>Annex 2</td>
							<td>Thing 1</td>
							<td>500</td>
                                                        <td>Garrett Winters</td>
						</tr>
                                                <tr onclick="window.location='order.jsp'">
							<td>802</td>
							<td>2/25/2020</td>
							<td>Warehouse 1</td>
							<td>Warehouse 2</td>
							<td>Big ole' thing</td>
							<td>999</td>
                                                        <td>Ashton Cox</td>
						</tr>
						<tr onclick="window.location='order.jsp'">
							<td>955</td>
							<td>3/15/2020</td>
							<td>Warehouse 1</td>
							<td>HQ</td>
							<td>Computer thing</td>
							<td>15</td>
                                                        <td>Cedric Kelly</td>
						</tr>
						<tr onclick="window.location='order.jsp'">
							<td>950</td>
							<td>4/1/2020</td>
							<td>Warehouse 1</td>
							<td>Warehouse 2</td>
							<td>Shiny Item 154</td>
							<td>100</td>
                                                        <td>Airi Satou</td>
						</tr>
						<tr onclick="window.location='order.jsp'">
							<td>711</td>
							<td>3/20/2020</td>
							<td>Warehouse 1</td>
							<td>Annex</td>
							<td>Shiny Item 14</td>
							<td>200</td>
                                                        <td>Brielle Williamson</td>
						</tr>
						<tr onclick="window.location='order.jsp'">
							<td>789</td>
							<td>3/20/2020</td>
							<td>Warehouse 1</td>
							<td>Annex</td>
							<td>Shiny Item 14</td>
							<td>50</td>
                                                        <td>Herrod Chandler</td>
						</tr>
					</tbody>
                                        <script>
                                        jQuery(document).ready(function($) {
                                            $(".clickable-row").click(function() {
                                            window.location = $(this).data("href");
                                            });
                                        });
                                        </script>
				</table>
			</div>
		</div>
	</div>
    
    
    
</div>
<%@include file="WEB-INF/includes/footer.jspf" %>