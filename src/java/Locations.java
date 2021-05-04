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
public class Locations extends HttpServlet {

    private String ID;
    private String city;
    private String zip;
    private String name;
    private String street;
    
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
        String locNum = request.getParameter("loc");
        if("getLoc".equals(action)){
            List<String> itemProperties = getLoc(locNum);
            request.setAttribute("locID", itemProperties.get(0));
            request.setAttribute("loc", itemProperties.get(0));
            request.setAttribute("locName", itemProperties.get(1));
            request.setAttribute("locStreet", itemProperties.get(2));
            request.setAttribute("locCity", itemProperties.get(3));
            request.setAttribute("locZip", itemProperties.get(4));
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("location.jsp");
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
        
        this.ID = request.getParameter("locID");
        this.city = request.getParameter("locCity");
        this.name = request.getParameter("locName");
        this.zip = request.getParameter("locZip");
        this.street = request.getParameter("locStreet");
        
        if (request.getParameter("getLocs") != null) {  
            try{            
                request.setAttribute("locTable", listLocs());
                request.setAttribute("loc", this.ID);
                RequestDispatcher dispatcher = request.getRequestDispatcher("locations.jsp");
                dispatcher.forward(request, response);

            } catch (Exception e) {
                System.out.println(e);
            }
        }
        else if (request.getParameter("update") != null) {
            updateLoc();
            
            List<String> itemProperties = getLoc(this.ID);
            request.setAttribute("locID", itemProperties.get(0));
            request.setAttribute("loc", itemProperties.get(0));
            request.setAttribute("locName", itemProperties.get(1));
            request.setAttribute("locStreet", itemProperties.get(2));
            request.setAttribute("locCity", itemProperties.get(3));
            request.setAttribute("locZip", itemProperties.get(4));
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("location.jsp");
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
    
    public String listLocs(){
        
        String finalOut = null;        
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select loc_id ,loc_name, loc_street, loc_city, loc_zip from locations";
            
            if(this.ID != null && !this.ID.trim().isEmpty() || this.city != null && !this.city.trim().isEmpty() || this.zip != null && !this.zip.trim().isEmpty() || this.name != null && !this.name.trim().isEmpty() || this.street != null && !this.street.trim().isEmpty()){
                sql += " WHERE ";
            }
            
            if(this.ID != null && !this.ID.trim().isEmpty()){
                sql += "loc_id = " + this.ID;
            }
            
            if(this.city != null && !this.city.trim().isEmpty()){
                if(this.ID != null && !this.ID.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "loc_city LIKE '%" + this.city  + "%'";
            }
            
            if(this.zip != null && !this.zip.trim().isEmpty()){
                if(this.ID != null && !this.ID.trim().isEmpty() || this.city != null && !this.city.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "loc_zip = " + this.zip;
            }
            
            if(this.name != null && !this.name.trim().isEmpty()){
                if(this.ID != null && !this.ID.trim().isEmpty() || this.city != null && !this.city.trim().isEmpty() || this.zip != null && !this.zip.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "loc_name LIKE '%" + this.name + "%'";
            }
            if(this.street != null && !this.street.trim().isEmpty()){
                if(this.ID != null && !this.ID.trim().isEmpty() || this.city != null && !this.city.trim().isEmpty() || this.name != null && !this.name.trim().isEmpty() || this.zip != null && !this.zip.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "loc_street LIKE '%" + this.street + "%'";
            }
            
            //System.out.println(sql);  //For debugging
            ResultSet rs = stmt.executeQuery(sql);
            
            finalOut = "<table class=\"table table-bordered table-hover\" id=\"dataTable\" width=\"100%\" cellspacing=\"0\">\n" +
                                        "<thead>\n" +
"						<tr>\n" +
"                                                    <th>ID</th>\n" +
"                                                    <th>Name</th>\n" +
"                                                    <th>Street</th>\n" +
"                                                    <th>City</th>\n" +
"                                                    <th>Zip Code</th>\n" +
"						</tr>\n" +
"					</thead>\n" +
"					<tfoot>\n" +
"						<tr>\n" +
"                                                    <th>ID</th>\n" +
"                                                    <th>Name</th>\n" +
"                                                    <th>Street</th>\n" +
"                                                    <th>City</th>\n" +
"                                                    <th>Zip Code</th>\n" +
"						</tr>\n" +
"					</tfoot>\n" + 
"                                       <tbody>";
            
            while (rs.next()) {
                finalOut += "<tr onclick=\"window.location='Locations?loc=" + rs.getString(1) + "&action=getLoc'\">\n" +
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
    
    public List<String> getLoc(String locID){        
        
        List<String> locInfo = new ArrayList<String>();        
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "SELECT loc_id ,loc_name, loc_street, loc_city, loc_zip FROM locations WHERE loc_id = " + locID;
            
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                
                locInfo.add(rs.getString(1));
                locInfo.add(rs.getString(2));
                locInfo.add(rs.getString(3));
                locInfo.add(rs.getString(4));
                locInfo.add(rs.getString(5));
            }
           
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return locInfo;
    }
    
    public void updateLoc(){
        
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "UPDATE locations SET ";
                        
            if(this.name != null && !this.name.trim().isEmpty()){
                sql += "loc_name = '" + this.name + "'";
            }
            
            if(this.street != null && !this.street.trim().isEmpty()){
                sql += ", ";
                sql += "loc_street = '" + this.street + "'";
            }
            
            if(this.city != null && !this.city.trim().isEmpty()){
                sql += ", ";
                sql += "loc_city = '" + this.city + "'";
            }
            if(this.zip != null && !this.zip.trim().isEmpty()){
                sql += ", ";
                sql += "loc_zip = " + this.zip;
            }  
            
            sql += " WHERE loc_id = " + this.ID + ";";
            
            
            //System.out.println(sql);  //For debugging
            stmt.executeUpdate(sql);
            conn.close();
            
        }catch(Exception ex){
            System.out.println(ex);
        }
    }
}
