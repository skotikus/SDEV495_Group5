import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.Clock;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Andrew Bellmio
 */
public class Orders extends HttpServlet {

    private String orderID;
    private String srcLocation;
    private String destLocation;
    private String itemName;
    private String qty;
    private String emp;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GetLocations</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetLocations at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String OrderNum = request.getParameter("order");
        if("getOrder".equals(action)){
            List<String> itemProperties = getOrder(OrderNum);
            request.setAttribute("orderID", itemProperties.get(0));
            request.setAttribute("impDate", itemProperties.get(1));
            request.setAttribute("compDate", itemProperties.get(2));
            request.setAttribute("srcLoc", itemProperties.get(3));
            request.setAttribute("destLoc", itemProperties.get(4));
            request.setAttribute("itemName", itemProperties.get(5));
            request.setAttribute("userName", itemProperties.get(6));
            request.setAttribute("orderQTY", itemProperties.get(7));
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("order.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the post input 
        this.orderID = request.getParameter("orderID");
        this.srcLocation = request.getParameter("srcLocation");
        this.destLocation = request.getParameter("destLocation");
        this.itemName = request.getParameter("itemName");
        this.qty = request.getParameter("qty");
        this.emp = request.getParameter("emp");
        
        try{            
            request.setAttribute("ordersTable", listOrders());
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("workorders.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            System.out.println(e);
        } finally {
                //conn.close();
        }
    }

       /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>


    public String listOrders() {
    
        String finalOut = "DEGBUG";
        Connection conn = null;


        try{
            //open a connection
            conn = Database.getConnection();

            //initialize statement
            Statement stmt = conn.createStatement();
            
            String sql = "SELECT order_id, imp_date, locations.loc_name, dest_loc ,items.item_name,order_qty, users.username FROM orders \n" +
                        "INNER JOIN locations ON orders.src_loc = locations.loc_id\n" +
                        "INNER JOIN items ON orders.item_id = items.item_id\n" +
                        "INNER JOIN users ON orders.user_id = users.user_id ";
            
            if(this.orderID != null && !this.orderID.trim().isEmpty() || this.srcLocation != null && !this.srcLocation.trim().isEmpty() || this.destLocation != null && !this.destLocation.trim().isEmpty() || this.itemName != null && !this.itemName.trim().isEmpty() || this.qty != null && !this.qty.trim().isEmpty() || this.emp != null && !this.emp.trim().isEmpty()){
                sql += " WHERE ";
            }
            
            if(this.orderID != null && !this.orderID.trim().isEmpty()){
                sql += "order_id = " + this.orderID;
            }
            
            if(this.srcLocation != null && !this.srcLocation.trim().isEmpty()){
                if(this.orderID != null && !this.orderID.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "locations.loc_name LIKE '%" + this.srcLocation + "%'";
            }
            
            if(this.destLocation != null && !this.destLocation.trim().isEmpty()){
                if(this.orderID != null && !this.orderID.trim().isEmpty() || this.srcLocation != null && !this.srcLocation.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "dest_loc = " + this.destLocation;
            }
            
            if(this.itemName != null && !this.itemName.trim().isEmpty()){
                if(this.orderID != null && !this.orderID.trim().isEmpty() || this.srcLocation != null && !this.srcLocation.trim().isEmpty() || this.destLocation != null && !this.destLocation.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "items.item_name LIKE '%" + this.itemName + "%'";
            }
            if(this.qty != null && !this.qty.trim().isEmpty()){
                if(this.orderID != null && !this.orderID.trim().isEmpty() || this.srcLocation != null && !this.srcLocation.trim().isEmpty() || this.destLocation != null && !this.destLocation.trim().isEmpty() || this.itemName != null && !this.itemName.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "order_qty = '" + this.qty + "'";
            } 
			if(this.emp != null && !this.emp.trim().isEmpty()){
                if(this.orderID != null && !this.orderID.trim().isEmpty() || this.srcLocation != null && !this.srcLocation.trim().isEmpty() || this.destLocation != null && !this.destLocation.trim().isEmpty() || this.itemName != null && !this.itemName.trim().isEmpty() || this.qty != null && !this.qty.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "users.username LIKE '%" + this.emp + "%'";
            }
            
            sql += " ORDER BY order_id";
            System.out.println(sql);
                
            //run the query and get the results
            ResultSet rs = stmt.executeQuery(sql);

            //formatting the top of the table
            finalOut = "<table class=\"table table-bordered table-hover\" id=\"dataTable\" width=\"100%\" cellspacing=\"0\">\n" +
                                                        "<thead>\n" +
"						<tr>\n" +
"                                                    <th>Order #</th>\n" +
"                                                    <th>Fill Date</th>\n" +
"                                                    <th>Src Location</th>\n" +
"                                                    <th>Dest Location</th>\n" +
"                                                    <th>Item</th>\n" +
"                                                    <th>QTY</th>\n" +
"                                                    <th>Emp. Assigned</th>\n" +                     
"						</tr>\n" +
"					</thead>\n" +
"					<tfoot>\n" +
"						<tr>\n" +
"                                                    <th>Order #</th>\n" +
"                                                    <th>Fill Date</th>\n" +
"                                                    <th>Src Location</th>\n" +
"                                                    <th>Dest Location</th>\n" +
"                                                    <th>Item</th>\n" +
"                                                    <th>QTY</th>\n" +
"                                                    <th>Emp. Assigned</th>\n" +                     
"						</tr>\n" +
"					</tfoot>\n" + 
"                                       <tbody>";
                            //while the set still has output, add it in to the table
                            while (rs.next()) {
                                finalOut += "<tr onclick=\"window.location='Orders?order=" + rs.getString(1) + "&action=getOrder'\">\n" +
                "                               <td>" + rs.getString(1) + "</td>\n" +
                "                               <td>" + rs.getString(2) + "</td>\n" +
                "                               <td>" + rs.getString(3) + "</td>\n" +
                "                               <td>" + rs.getString(4) + "</td>\n" +
                "                               <td>" + rs.getString(5) + "</td>\n" +
                "                               <td>" + rs.getString(6) + "</td>\n" +
                "                               <td>" + rs.getString(7) + "</td>\n" +
                "                             </tr>";
            }
            //close the table
            finalOut += "</table>";
            //close the connection
            conn.close();
            

        } catch (Exception e) {
            System.out.println(e);
        }
        
        return finalOut;
    }

    public String createOrder() {

        String finalOut = "DEGBUG";
        Connection conn = null;
        
        String sqlOrderQuery = 
            "SELECT work_id FROM work_orders ORDER BY work_id DESC limit 1;";
        int lastWorkID;
        
        

        try{
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sqlOrderQuery);
            lastWorkID = rs.getInt(1);


    
        } catch (Exception e) {
            System.out.println(e);
        }
        return "DEBUG";
    }

    public String deleteOrder() throws SQLException {

        String finalOut = "DEGBUG";
        Connection conn = null;
        Statement stmt = conn.createStatement();

        try{
            
            String sqlDeleteQuery = "delete from work_id";
        
    
        } catch (Exception e) {
            System.out.println(e);
        }

        return "DEBUG";
    }

    public String updateOrder() throws SQLException  
    {

        String finalOut = "DEGBUG";
        Connection conn = null;
        Statement stmt = conn.createStatement();

        try{

    
        } catch (Exception e) {
            System.out.println(e);
        }

        return "DEBUG";
    }
    
    public List<String> getOrder(String orderID){        
        
        List<String> orderInfo = new ArrayList<String>();        
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "SELECT order_id, imp_date,comp_date, locations.loc_name, dest_loc ,items.item_name,order_qty, users.username FROM orders \n" +
                        "INNER JOIN locations ON orders.src_loc = locations.loc_id\n" +
                        "INNER JOIN items ON orders.item_id = items.item_id\n" +
                        "INNER JOIN users ON orders.user_id = users.user_id \n"
                        + "WHERE order_id = " + orderID;
            
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                
                orderInfo.add(rs.getString(1));
                orderInfo.add(rs.getString(2));
                orderInfo.add(rs.getString(3));
                orderInfo.add(rs.getString(4));
                orderInfo.add(rs.getString(5));
                orderInfo.add(rs.getString(6));
                orderInfo.add(rs.getString(8));
                orderInfo.add(rs.getString(7));
            }
           
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return orderInfo;
    }


} 