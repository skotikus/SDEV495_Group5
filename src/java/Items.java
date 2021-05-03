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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author scott
 */
public class Items extends HttpServlet {
   
    private String sku;
    private String location;
    private String qty;
    private String name;
    private String color;
    public Integer itemSKU;
    public String itemName;
    public Integer itemQTY;
    public String itemLoc;
    public String itemColor;

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
        
        String action = request.getParameter("action");
        String itemNum = request.getParameter("item");
        if("getItem".equals(action)){
            List<String> itemProperties = getItem(itemNum);
            request.setAttribute("itemSKU", itemProperties.get(0));
            request.setAttribute("item", itemProperties.get(0));
            request.setAttribute("itemName", itemProperties.get(1));
            request.setAttribute("itemQTY", itemProperties.get(2));
            request.setAttribute("itemLoc", itemProperties.get(3));
            request.setAttribute("itemColor", itemProperties.get(4));
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("item.jsp");
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
            this.sku = request.getParameter("itemSKU");
            this.location = request.getParameter("itemLOC");
            this.name = request.getParameter("itemName");
            this.qty = request.getParameter("itemQTY");
            this.color = request.getParameter("itemColor");
        
        if (request.getParameter("getItems") != null) {  
            try{            
                request.setAttribute("itemTable", listItems());
                request.setAttribute("item", this.sku);
                RequestDispatcher dispatcher = request.getRequestDispatcher("inventory.jsp");
                dispatcher.forward(request, response);

            } catch (Exception e) {
                System.out.println(e);
            }
        }
        else if (request.getParameter("update") != null) {
            updateItem();
            request.setAttribute("item", this.sku);
            
            List<String> itemProperties = getItem(this.sku);
            request.setAttribute("itemSKU", itemProperties.get(0));
            request.setAttribute("itemName", itemProperties.get(1));
            request.setAttribute("itemQTY", itemProperties.get(2));
            request.setAttribute("itemLoc", itemProperties.get(3));
            request.setAttribute("itemColor", itemProperties.get(4));
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("item.jsp");
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
    
    public String listItems(){
        
        String finalOut = null;        
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select item_id ,item_name, item_qty, item_loc, item_color from items";
            
            if(this.sku != null && !this.sku.trim().isEmpty() || this.location != null && !this.location.trim().isEmpty() || this.name != null && !this.name.trim().isEmpty() || this.qty != null && !this.qty.trim().isEmpty() || this.color != null && !this.color.trim().isEmpty()){
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
            if(this.color != null && !this.color.trim().isEmpty()){
                if(this.sku != null && !this.sku.trim().isEmpty() || this.location != null && !this.location.trim().isEmpty() || this.name != null && !this.name.trim().isEmpty() || this.qty != null && !this.qty.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "item_color = '" + this.color + "'";
            }  
            
            //System.out.println(sql);  //For debugging
            ResultSet rs = stmt.executeQuery(sql);
            
            finalOut = "<table class=\"table table-bordered table-hover\" id=\"dataTable\" width=\"100%\" cellspacing=\"0\">\n" +
                                        "<thead>\n" +
"						<tr>\n" +
"                                                    <th>SKU</th>\n" +
"                                                    <th>Name</th>\n" +
"                                                    <th>Quantity</th>\n" +
"                                                    <th>Location</th>\n" +
"                                                    <th>Color</th>\n" +  
"						</tr>\n" +
"					</thead>\n" +
"					<tfoot>\n" +
"						<tr>\n" +
"                                                    <th>SKU</th>\n" +
"                                                    <th>Name</th>\n" +
"                                                    <th>Quantity</th>\n" +
"                                                    <th>Location</th>\n" +
"                                                    <th>Color</th>\n" +                  
"						</tr>\n" +
"					</tfoot>\n" + 
"                                       <tbody>";
            
            while (rs.next()) {
                finalOut += "<tr onclick=\"window.location='Items?item=" + rs.getString(1) + "&action=getItem'\">\n" +
"                               <td>" + rs.getString(1) + "</td>\n" +
"                               <td>" + rs.getString(2) + "</td>\n" +
"                               <td>" + rs.getString(3) + "</td>\n" +
"                               <td>" + rs.getString(4) + "</td>\n" +
"                               <td>" + rs.getString(5) + "</td>\n" +
"                             </tr>";
            }
            finalOut += "</table>";
            conn.close();
            

        } catch (Exception e) {
            System.out.println(e);
        }
        
        
        return finalOut;
    }
    
    public List<String> getItem(String itemID){        
        
        List<String> itemInfo = new ArrayList<String>();        
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select item_id ,item_name, item_qty, item_loc, item_color from items WHERE item_id = " + itemID;
            
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                
                itemInfo.add(rs.getString(1));
                itemInfo.add(rs.getString(2));
                itemInfo.add(rs.getString(3));
                itemInfo.add(rs.getString(4));
                itemInfo.add(rs.getString(5));
            }
           
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return itemInfo;
    }
    
    
    public void updateItem(){
        
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "UPDATE items SET ";
                        
            if(this.location != null && !this.location.trim().isEmpty()){
                sql += "item_loc = " + this.location;
            }
            
            if(this.name != null && !this.name.trim().isEmpty()){
                sql += ", ";
                sql += "item_name = '" + this.name + "'";
            }
            
            if(this.qty != null && !this.qty.trim().isEmpty()){
                sql += ", ";
                sql += "item_qty = " + this.qty;
            }
            if(this.color != null && !this.color.trim().isEmpty()){
                sql += ", ";
                sql += "item_color = '" + this.color + "'";
            }  
            
            sql += " WHERE item_id = " + this.sku + ";";
            
            
            //System.out.println(sql);  //For debugging
            stmt.executeUpdate(sql);
            conn.close();
            
        }catch(Exception ex){
            System.out.println(ex);
        }
    }
}
