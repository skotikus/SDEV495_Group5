/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.sun.webkit.dom.StyleSheetImpl;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author scott
 */
public class Users extends HttpServlet {

    private HttpSession session;
    private String passF;
    private String confPassf;
    
       
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
            out.println("<title>Servlet Users</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Users at " + request.getContextPath() + "</h1>");
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
        if(session.getAttribute("UserName") == null){
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }

        //String action = request.getParameter("action");
        //if("profile".equals(action)){
            Integer userID = (Integer) session.getAttribute("UserID");
            List<String> userProperties = getProfile(userID);
            request.setAttribute("userID", userProperties.get(0));
            request.setAttribute("userName", userProperties.get(1));
            request.setAttribute("firstName", userProperties.get(2));
            request.setAttribute("lastName", userProperties.get(3));
            request.setAttribute("userEmail", userProperties.get(4));

            RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
            dispatcher.forward(request, response);
        //}
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
        
        session = request.getSession(false);
        Integer userID = (Integer) session.getAttribute("UserID");
        this.passF = request.getParameter("newpass");
        this.confPassf = request.getParameter("newpassconf");
        if(request.getParameter("update") != null){ 
            if(this.passF != null && !this.passF.trim().isEmpty() && this.confPassf != null && !this.confPassf.trim().isEmpty()){
                if(passF.equals(confPassf)){
                    updatePassword(userID);
                }
            }else{
                request.setAttribute("ErrorMessage", "Must fill out both password fields to change password.");
            }
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
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
    
    
    public List<String> getProfile(Integer userID){
    List<String> userInfo = new ArrayList<String>();        
        Connection conn = null;
        
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select user_id, username, firstname, lastname, email from users WHERE user_id = " + userID;
            
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                
                userInfo.add(rs.getString(1)); //user_ID
                userInfo.add(rs.getString(2)); //username
                userInfo.add(rs.getString(3)); //firstname
                userInfo.add(rs.getString(4)); //lastname 
                userInfo.add(rs.getString(5)); //email
            }
           
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return userInfo;
    
    
    }
    
    public void updatePassword(Integer userID){
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "UPDATE user_info SET  password = '" + this.passF + "'";
            sql += " WHERE user_id = " + userID;
            
            
            //System.out.println(sql);  //For debugging
            stmt.executeUpdate(sql);
            conn.close();
            
        }catch(Exception ex){
            System.out.println(ex);
        }
    }


}
