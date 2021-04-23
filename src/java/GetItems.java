/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author scott
 */
public class GetItems extends HttpServlet {
    
    private HttpSession session;
    private String sku;
    private String location;
    private String qty;
    private String name;

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
            out.println("<title>Servlet Authenticate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>You should never see this page</h1>");
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
        processRequest(request, response);
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
        this.sku = request.getParameter("itemSKU");
        this.location = request.getParameter("itemLOC");
        this.name = request.getParameter("itemName");
        this.qty = request.getParameter("itemQTY");
        
        try{
            session = request.getSession(true);
            session.setAttribute("itemTable", queryItems());
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("items.jsp");
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
    
    public String queryItems(){
        
        String finalOut = null;
        System.out.println(this.sku);
        System.out.println(this.location);
        System.out.println(this.name);
        System.out.println(this.qty);
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select item_id ,item_name, item_qty, item_loc from items";
            
            if(this.sku != null && !this.sku.trim().isEmpty() || this.location != null && !this.location.trim().isEmpty() || this.name != null && !this.name.trim().isEmpty() || this.qty != null && !this.qty.trim().isEmpty()){
                sql += " WHERE ";
            }
            
            if(this.sku != null && !this.sku.trim().isEmpty()){
                sql += "item_id = " + this.sku;
            }
            
            if(this.location != null && !this.location.trim().isEmpty()){
                if(this.sku != null && !this.sku.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "item_loc = " + this.location;
            }
            
            if(this.name != null && !this.name.trim().isEmpty()){
                if(this.sku != null && !this.sku.trim().isEmpty() || this.location != null && !this.location.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "item_name LIKE '%" + this.name + "%'";
            }
            
            if(this.qty != null && !this.qty.trim().isEmpty()){
                if(this.sku != null && !this.sku.trim().isEmpty() || this.location != null && !this.location.trim().isEmpty() || this.name != null && !this.name.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "item_qty = " + this.qty;
            }    
            
                        
            ResultSet rs = stmt.executeQuery(sql);
            
            finalOut = "<table class=\"table table-bordered\" id=\"dataTable\" width=\"100%\" cellspacing=\"0\">\n" +
                                        "<thead>\n" +
"						<tr>\n" +
"                                                    <th>SKU</th>\n" +
"                                                    <th>Name</th>\n" +
"                                                    <th>Quantity</th>\n" +
"                                                    <th>Location</th>\n" +
"						</tr>\n" +
"					</thead>\n" +
"					<tfoot>\n" +
"						<tr>\n" +
"                                                    <th>SKU</th>\n" +
"                                                    <th>Name</th>\n" +
"                                                    <th>Quantity</th>\n" +
"                                                    <th>Location</th>\n" +
"						</tr>\n" +
"					</tfoot>\n" + 
"                                       <tbody>";
            
            while (rs.next()) {
                finalOut += "<tr>\n" +
"                               <td>" + rs.getString(1) + "</td>\n" +
"                               <td>" + rs.getString(2) + "</td>\n" +
"                               <td>" + rs.getString(3) + "</td>\n" +
"                               <td>" + rs.getString(4) + "</td>\n" +
"                             </tr>";
            }
            finalOut += "</table>";
            conn.close();
            

        } catch (Exception e) {
            System.out.println(e);
        }
        
        
        return finalOut;
    }
}
