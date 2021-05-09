/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author scott
 */
@WebServlet(urlPatterns = {"/Dashboard"})
public class Dashboard extends HttpServlet {

    private HttpSession session;
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
            out.println("<title>Servlet Dashboard</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Dashboard at " + request.getContextPath() + "</h1>");
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
        
        session = request.getSession(false);
        Integer userID = (Integer) session.getAttribute("UserID");
        Integer locID = (Integer) session.getAttribute("Location");
        
        request.setAttribute("locItems", locItemsNum(locID));
        request.setAttribute("openOrders", openOrdersNum());
        request.setAttribute("myOrders", getMyOrdersNum(userID));
        request.setAttribute("ordersTable", getMyOrders(userID));
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
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
        
        HttpSession session = request.getSession(false);
        Integer userID = (Integer) session.getAttribute("UserID");
        Integer locID = (Integer) session.getAttribute("Location");
        
        request.setAttribute("locItems", locItemsNum(locID));
        request.setAttribute("openOrders", openOrdersNum());
        request.setAttribute("myOrders", getMyOrdersNum(userID));
        request.setAttribute("ordersTable", getMyOrders(userID));
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
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
    
    public Integer getMyOrdersNum(Integer userID){
        Integer openOrders = 0;
        
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sqlMyOrders = "SELECT COUNT(order_id) FROM orders WHERE user_id = " + userID;
            ResultSet rs = stmt.executeQuery(sqlMyOrders);
            while (rs.next()) {
                openOrders = rs.getInt(1);
            }
            conn.close();            
        }catch(Exception ex){
            System.out.println(ex);
        }
        return openOrders;
    }
    
    public Integer openOrdersNum(){
        Integer openOrders = 0;
        
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sqlMyOrders = "SELECT COUNT(order_id) FROM orders WHERE comp_Date IS NULL";
            ResultSet rs = stmt.executeQuery(sqlMyOrders);
            while (rs.next()) {
                openOrders = rs.getInt(1);
            }
            conn.close();            
        }catch(Exception ex){
            System.out.println(ex);
        }
        return openOrders;
    }
    
    public Integer locItemsNum(int locID){
        Integer items = 0;
        
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sqlMyOrders = "SELECT COUNT(item_id) FROM items WHERE item_loc = " + locID;
            ResultSet rs = stmt.executeQuery(sqlMyOrders);
            while (rs.next()) {
                items = rs.getInt(1);
            }
            conn.close();            
        }catch(Exception ex){
            System.out.println(ex);
        }
        return items;
    }
    
    public String getMyOrders(Integer methodUserID){
        
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
            
            sql += "WHERE orders.user_id = " + methodUserID + " AND status = 1";
            
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
  
}
