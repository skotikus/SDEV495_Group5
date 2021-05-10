import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

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
    private String impDate;
    private String compDate;
    private String status;
    
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
        request.setAttribute("dropUsers", dropUsersPop());
        request.setAttribute("dropLocs", dropLocPop());
        
        if("getOrder".equals(action)){
            List<String> orderProperties = getOrder(OrderNum);
            request.setAttribute("orderID", orderProperties.get(0));
            request.setAttribute("impDate", orderProperties.get(1));
            request.setAttribute("compDate", orderProperties.get(2));
            request.setAttribute("srcLoc", orderProperties.get(3));
            request.setAttribute("destLoc", orderProperties.get(4));
            request.setAttribute("itemName", orderProperties.get(5));
            request.setAttribute("userName", orderProperties.get(6));
            request.setAttribute("orderQTY", orderProperties.get(7));
            request.setAttribute("orderStatus", orderProperties.get(8));
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("order.jsp");
            dispatcher.forward(request, response);
        }
        if("new".equals(action)){
            RequestDispatcher dispatcher = request.getRequestDispatcher("order.jsp");
            dispatcher.forward(request, response);
        }
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
        request.setAttribute("dropUsers", dropUsersPop());
        request.setAttribute("dropLocs", dropLocPop());
        this.orderID = request.getParameter("orderID");
        this.srcLocation = request.getParameter("srcLoc");
        this.destLocation = request.getParameter("destLoc");
        this.itemName = request.getParameter("itemName");
        this.impDate = request.getParameter("impDate");
        this.compDate = request.getParameter("compDate");
        this.qty = request.getParameter("orderQTY");
        this.emp = request.getParameter("userName");
        this.status = request.getParameter("status");
        if(this.status == null ){
            this.status = "true";
        }
        
        
        if (request.getParameter("listOrders") != null) { 
            try{            
                request.setAttribute("ordersTable", listOrders());

                RequestDispatcher dispatcher = request.getRequestDispatcher("workorders.jsp");
                dispatcher.forward(request, response);

            } catch (Exception e) {
                System.out.println(e);
            }
        }
        
        else if (request.getParameter("update") != null) {
            
            request.setAttribute("order", this.orderID);
            request.setAttribute("completed", updateOrder());
            
            List<String> orderProperties = getOrder(this.orderID);
            request.setAttribute("orderID", orderProperties.get(0));
            request.setAttribute("impDate", orderProperties.get(1));
            request.setAttribute("compDate", orderProperties.get(2));
            request.setAttribute("srcLoc", orderProperties.get(3));
            request.setAttribute("destLoc", orderProperties.get(4));
            request.setAttribute("itemName", orderProperties.get(5));
            request.setAttribute("userName", orderProperties.get(6));
            request.setAttribute("orderQTY", orderProperties.get(7));
            request.setAttribute("orderStatus", orderProperties.get(8));
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("order.jsp");
            dispatcher.forward(request, response);
            
        }        
        else if (request.getParameter("delete") != null) {
            request.setAttribute("completed", deleteOrder());
                        
            RequestDispatcher dispatcher = request.getRequestDispatcher("workorders.jsp");
            dispatcher.forward(request, response);
            
        }
        else if (request.getParameter("create") != null) {
            request.setAttribute("completed", newOrder());
            
            List<String> orderProperties = getOrder(this.orderID);
            request.setAttribute("orderID", orderProperties.get(0));
            request.setAttribute("impDate", orderProperties.get(1));
            request.setAttribute("compDate", orderProperties.get(2));
            request.setAttribute("srcLoc", orderProperties.get(3));
            request.setAttribute("destLoc", orderProperties.get(4));
            request.setAttribute("itemName", orderProperties.get(5));
            request.setAttribute("userName", orderProperties.get(6));
            request.setAttribute("orderQTY", orderProperties.get(7));
            request.setAttribute("orderStatus", orderProperties.get(8));
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("order.jsp");
            dispatcher.forward(request, response);
        }
        
        else if (request.getParameter("execute") != null) {
            request.setAttribute("completed", execOrder());
            
            List<String> orderProperties = getOrder(this.orderID);
            request.setAttribute("orderID", orderProperties.get(0));
            request.setAttribute("impDate", orderProperties.get(1));
            request.setAttribute("compDate", orderProperties.get(2));
            request.setAttribute("srcLoc", orderProperties.get(3));
            request.setAttribute("destLoc", orderProperties.get(4));
            request.setAttribute("itemName", orderProperties.get(5));
            request.setAttribute("userName", orderProperties.get(6));
            request.setAttribute("orderQTY", orderProperties.get(7));
            request.setAttribute("orderStatus", orderProperties.get(8));
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("order.jsp");
            dispatcher.forward(request, response);
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
            
            String sql = "SELECT order_id, imp_date, L1.loc_name AS src_loc_name, L2.loc_name AS dest_loc_name, items.item_name,order_qty, users.username FROM orders \n" +
                        "LEFT JOIN locations L1 ON orders.src_loc = L1.loc_id\n" +
                        "LEFT JOIN locations L2 ON orders.dest_loc = L2.loc_id\n" +
                        "INNER JOIN items ON orders.item_id = items.item_id\n" +
                        "LEFT JOIN users ON orders.user_id = users.user_id ";
            
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
                sql += "L1.loc_name LIKE '%" + this.srcLocation + "%'";
            }
            
            if(this.destLocation != null && !this.destLocation.trim().isEmpty()){
                if(this.orderID != null && !this.orderID.trim().isEmpty() || this.srcLocation != null && !this.srcLocation.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "L2.loc_name LIKE '%" + this.destLocation + "%'";
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
            //System.out.println(sql);
                
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

    public String newOrder(){
        String works = "error";
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "INSERT INTO orders (order_id, imp_date, comp_date, src_loc, dest_loc, item_id, user_id, order_qty) Values (";
            
			
            sql += this.orderID + ", ";
            sql += "'" + this.impDate + "', ";
            if(this.compDate != null && !this.compDate.trim().isEmpty()){
                sql += "'" + this.compDate + "', ";
            }
            else{
                sql += "null, ";
            }
            sql += this.srcLocation + ", ";
            if(this.destLocation != null && !this.destLocation.trim().isEmpty()){
                sql += this.destLocation + ", ";
            }
            else{
                sql += "null, ";
            }
            sql += this.itemName + ", ";
            if(this.emp != null && !this.emp.trim().isEmpty()){
                sql += "(SELECT users.user_id FROM users WHERE users.username = '" + this.emp + "'), ";
            }
            else{
                sql += "null, ";
            }
                        
            sql += this.qty + ") ";
                        
            System.out.println(sql);  //For debugging
            stmt.executeUpdate(sql);
            works = "created";
            conn.close();
        }catch(Exception ex){
            System.out.println(ex);
        }
        return works;
    }

    public String deleteOrder(){
        String works = "error";
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "DELETE FROM orders WHERE order_id = " + this.orderID;
            stmt.executeUpdate(sql);
            conn.close();
            works = "deleted";
        }catch(Exception ex){
            System.out.println(ex);
        }
        return works;
    }

    public String updateOrder()
    {
        String works = "error";
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            //find out how to translate locations or make drop downs

            String sql = "UPDATE orders SET ";
                        
            sql += "imp_date = '" + this.impDate + "'";
            sql += ",comp_date = '" + this.compDate + "'"; 
            sql += ",src_loc = '" + this.srcLocation + "'";
            sql += ",dest_loc = '" + this.destLocation + "'";
            sql += ",order_qty = " + this.qty;
            sql += ",status = " + this.status;
            sql += ",user_id = (SELECT users.user_id FROM users WHERE users.username = '" + this.emp + "')";
                        
            sql += " WHERE order_id = " + this.orderID + ";";
            
            //System.out.println(sql);  //For debugging
            stmt.executeUpdate(sql);
            conn.close();
            works = "updated";
        }catch(Exception ex){
            System.out.println(ex);
        }
        return works;
    }
    
    public List<String> getOrder(String orderID){        
        
        List<String> orderInfo = new ArrayList<String>();        
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "SELECT order_id, imp_date,comp_date, L1.loc_name AS src_loc_name, L2.loc_name AS dest_loc_name,items.item_name,order_qty, users.username,status FROM orders \n" +
                        "LEFT JOIN locations L1 ON orders.src_loc = L1.loc_id\n" +
                        "LEFT JOIN locations L2 ON orders.dest_loc = L2.loc_id\n" +
                        "INNER JOIN items ON orders.item_id = items.item_id\n" +
                        "LEFT JOIN users ON orders.user_id = users.user_id \n"
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
                orderInfo.add(rs.getString(9));
            }
           
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return orderInfo;
    }

    public List<String> dropUsersPop(){
        List<String> dropUsers = new ArrayList();
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "SELECT username FROM users";
            
            //System.out.println(sql);  //For debugging
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                dropUsers.add(rs.getString(1));
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    
        return dropUsers;
    }
    
    public List<String> dropLocPop(){
        List<String> dropLocs = new ArrayList();
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "SELECT loc_name FROM locations ORDER BY loc_id";
            
            //System.out.println(sql);  //For debugging
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                dropLocs.add(rs.getString(1));
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    
        return dropLocs;
    } 
    
     public String execOrder()
    {
        String works = "error";
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            
            LocalDateTime myDateObj = LocalDateTime.now(); 
            DateTimeFormatter datePattern = DateTimeFormatter.ofPattern("dd/MM/yyyy");      
            String formattedDate = myDateObj.format(datePattern); 
            
            String sql1 = "UPDATE orders SET ";
            sql1 += "comp_date = '"+ formattedDate + "'";
            sql1 += ", status = false";
            sql1 += " WHERE order_id = " + this.orderID + ";";
            //System.out.println("SQL 1: " + sql1);  //For debugging
                  
            stmt.executeUpdate(sql1);
            
            String sql2 = "UPDATE items SET ";
            sql2 += "item_loc = " + this.destLocation;
            sql2 += " WHERE item_name = '" + this.itemName + "';";
            System.out.println("SQL 2: " + sql2);  //For debugging
            stmt.executeUpdate(sql2);
            
            
            conn.close();
            works = "updated";
        }catch(Exception ex){
            System.out.println(ex);
        }
        return works;
    }
} 