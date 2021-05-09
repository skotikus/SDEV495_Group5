/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
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
    private String userID;
    private String username; 
    private String firstName;
    private String lastName;
    private String email;
    private String role;

       
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
        String userNum = request.getParameter("user");
        String action = request.getParameter("action");
        request.setAttribute("dropRoles", dropRolePop());
        
        if("profile".equals(action)){
            Integer sessionID = (Integer) session.getAttribute("UserID");
            List<String> userProperties = getProfile(sessionID);
            request.setAttribute("userID", userProperties.get(0));
            request.setAttribute("userName", userProperties.get(1));
            request.setAttribute("firstName", userProperties.get(2));
            request.setAttribute("lastName", userProperties.get(3));
            request.setAttribute("userEmail", userProperties.get(4));
            request.setAttribute("roleName", getRoleName(sessionID.toString()));

            RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
            dispatcher.forward(request, response);
        }
        else if("getUser".equals(action)){
            List<String> userProperties = getUser(userNum);
            request.setAttribute("userID", userProperties.get(0));
            request.setAttribute("userName", userProperties.get(1));
            request.setAttribute("firstName", userProperties.get(2));
            request.setAttribute("lastName", userProperties.get(3));
            request.setAttribute("userEmail", userProperties.get(4));
            request.setAttribute("roleName", getRoleName(userNum));
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("user.jsp");
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
        
        session = request.getSession(false);
        Integer sessionID = (Integer) session.getAttribute("UserID");
        this.userID = request.getParameter("formUID");
        this.username = request.getParameter("formUN");
        this.firstName = request.getParameter("formFirst");
        this.lastName = request.getParameter("formLast");
        this.email = request.getParameter("formEmail");
        this.role = request.getParameter("formRole");
            
        if(request.getParameter("getUsers") != null){
            try{            
                request.setAttribute("userTable", listUsers());
                request.setAttribute("item", this.userID);
                RequestDispatcher dispatcher = request.getRequestDispatcher("users.jsp");
                dispatcher.forward(request, response);

            } catch (Exception e) {
                System.out.println(e);
            }
        }
        
        else if (request.getParameter("update") != null) {
            request.setAttribute("user", this.userID);
            request.setAttribute("completed", updateUser());
            updateRole();
            
            List<String> userProperties = getUser(this.userID);
            request.setAttribute("userID", userProperties.get(0));
            request.setAttribute("userName", userProperties.get(1));
            request.setAttribute("firstName", userProperties.get(2));
            request.setAttribute("lastName", userProperties.get(3));
            request.setAttribute("userEmail", userProperties.get(4));
            request.setAttribute("roleName", userProperties.get(5));
                        
            if(request.getAttribute("errorMessage") == null){
                request.setAttribute("errorMessage", "Couldn't update user account.");
            }
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("user.jsp");
            dispatcher.forward(request, response);
            
        }
        else if (request.getParameter("profileupdate") != null) {
            this.userID = sessionID.toString();
            request.setAttribute("user", this.userID);
            
            request.setAttribute("completed", updateUser());
                        
            List<String> userProperties = getProfile(sessionID);
            request.setAttribute("userID", userProperties.get(0));
            request.setAttribute("userName", userProperties.get(1));
            request.setAttribute("firstName", userProperties.get(2));
            request.setAttribute("lastName", userProperties.get(3));
            request.setAttribute("userEmail", userProperties.get(4));
            request.setAttribute("roleName", userProperties.get(5));
            
            if(request.getParameterMap().containsKey("newpass")){
                this.passF = request.getParameter("newpass");
                this.confPassf = request.getParameter("newpassconf");
                if(this.passF != null && !this.passF.trim().isEmpty() && this.confPassf != null && !this.confPassf.trim().isEmpty()){
                    if(passF.equals(confPassf)){
                        request.setAttribute("completed", updatePassword(sessionID));
                    }
                    else{
                        request.setAttribute("completed", "error");
                        request.setAttribute("errorMessage", "Failed to change password. Check that password fields match.");
                    }
                }
            }
            
            if(request.getAttribute("errorMessage") == null){
                request.setAttribute("errorMessage", "Couldn't update user account.");
            }
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
            dispatcher.forward(request, response);
            
        } 
        else if (request.getParameter("delete") != null) {
            this.userID = request.getParameter("formUID");
            
            if(sessionID == (Integer.parseInt(this.userID))){
                request.setAttribute("completed", "error");
                request.setAttribute("errorMessage", "Cannot delete your own account silly!");
            }
            else{
                request.setAttribute("completed", deleteUser());
            }
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("users.jsp");
            dispatcher.forward(request, response);
            
        }
        else if (request.getParameter("create") != null) {
            request.setAttribute("completed", newUser());
            request.setAttribute("errorMessage", "Counldn't create user account. Please check logs.");
            
            List<String> userProperties = getUser(this.userID);
            request.setAttribute("userID", userProperties.get(0));
            request.setAttribute("userName", userProperties.get(1));
            request.setAttribute("firstName", userProperties.get(2));
            request.setAttribute("lastName", userProperties.get(3));
            request.setAttribute("userEmail", userProperties.get(4));
            request.setAttribute("roleName", userProperties.get(5));
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("user.jsp");
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
    
    
    public List<String> getProfile(Integer userID){
    List<String> userInfo = new ArrayList();        
        Connection conn = null;
        
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select user_id, username, firstname, lastname, email, role_id from users WHERE user_id = " + userID;
            
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                
                userInfo.add(rs.getString(1)); //user_ID
                userInfo.add(rs.getString(2)); //username
                userInfo.add(rs.getString(3)); //firstname
                userInfo.add(rs.getString(4)); //lastname 
                userInfo.add(rs.getString(5)); //email
                userInfo.add(rs.getString(6)); //Role
            }
           
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return userInfo;
    
    
    }
    
    public String updatePassword(Integer userID){
        String works = "error";
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "UPDATE user_info SET  password = '" + this.passF + "'";
            sql += " WHERE user_id = " + userID;
            
            
            //System.out.println(sql);  //For debugging
            stmt.executeUpdate(sql);
            conn.close();
            works = "updated";
        }catch(Exception ex){
            System.out.println(ex);
        }
        return works;
    }
    
    public String listUsers(){
        
        String finalOut = null;        
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select user_id ,firstname, lastname, username, email from users";
            
            if(this.userID != null && !this.userID.trim().isEmpty() || this.username != null && !this.username.trim().isEmpty() || this.firstName != null && !this.firstName.trim().isEmpty() || this.lastName != null && !this.lastName.trim().isEmpty() || this.email != null && !this.email.trim().isEmpty()){
                sql += " WHERE ";
            }
            
            if(this.userID != null && !this.userID.trim().isEmpty()){
                sql += "user_id = " + this.userID;
            }
            
            if(this.username != null && !this.username.trim().isEmpty()){
                if(this.userID != null && !this.userID.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "username LIKE '%" + this.username + "%'";
            }
            
            if(this.firstName != null && !this.firstName.trim().isEmpty()){
                if(this.userID != null && !this.userID.trim().isEmpty() || this.username != null && !this.username.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "firstname LIKE '%" + this.firstName + "%'";
            }
            
            if(this.lastName != null && !this.lastName.trim().isEmpty()){
                if(this.userID != null && !this.userID.trim().isEmpty() || this.username != null && !this.username.trim().isEmpty() || this.firstName != null && !this.firstName.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "lastname LIKE '%" + this.lastName + "%'";
            }
            if(this.email != null && !this.email.trim().isEmpty()){
                if(this.userID != null && !this.userID.trim().isEmpty() || this.username != null && !this.username.trim().isEmpty() || this.firstName != null && !this.firstName.trim().isEmpty() || this.lastName != null && !this.lastName.trim().isEmpty()){
                    sql += " AND ";
                }
                sql += "email LIKE '%" + this.email + "%'";
            }  
            
            //System.out.println(sql);  //For debugging
            ResultSet rs = stmt.executeQuery(sql);
            
            finalOut = "<table class=\"table table-bordered table-hover\" id=\"table\" width=\"100%\" cellspacing=\"0\">\n" +
                                        "<thead>\n" +
"						<tr>\n" +
"                                                    <th>ID</th>\n" +
"                                                    <th>First Name</th>\n" +
"                                                    <th>Last Name</th>\n" +
"                                                    <th>Username</th>\n" +
"                                                    <th>Email</th>\n" +  
"						</tr>\n" +
"					</thead>\n" +
"					<tfoot>\n" +
"						<tr>\n" +
"                                                    <th>ID</th>\n" +
"                                                    <th>First Name</th>\n" +
"                                                    <th>Last Name</th>\n" +
"                                                    <th>Username</th>\n" +
"                                                    <th>Email</th>\n" +                  
"						</tr>\n" +
"					</tfoot>\n" + 
"                                       <tbody>";
            
            while (rs.next()) {
                finalOut += "<tr onclick=\"window.location='Users?user=" + rs.getString(1) + "&action=getUser'\">\n" +
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
    
    public List<String> getUser(String userID){        
        
        List<String> userInfo = new ArrayList<>();        
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select user_id ,username, firstname, lastname, email, role_id from users WHERE user_id = " + userID;
            
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                
                userInfo.add(rs.getString(1));
                userInfo.add(rs.getString(2));
                userInfo.add(rs.getString(3));
                userInfo.add(rs.getString(4));
                userInfo.add(rs.getString(5));
                userInfo.add(rs.getString(6));
            }
           
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return userInfo;
    }
    
    public String deleteUser(){
        String works = "error";
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "DELETE FROM users WHERE user_id = " + this.userID;
            stmt.executeUpdate(sql);
            conn.close();
            works = "deleted";
        }catch(Exception ex){
            System.out.println(ex);
        }
        return works;
    }
    
    public String newUser(){
        String works = "error";
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "INSERT INTO users (user_Id, username, firstname, lastname, email) Values (";
            
                sql += this.userID + ", ";
                sql += "'" + this.username + "', ";
                sql += "'" + this.firstName + "', ";
                sql += "'" + this.lastName + "', ";
                sql += "'" + this.email + "')";
                        
            System.out.println(sql);  //For debugging
            stmt.executeUpdate(sql);
            works = "created";
            conn.close();
        }catch(Exception ex){
            System.out.println(ex);
        }
        return works;
    }
    
    public String updateUser(){
        String works = "error";
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "UPDATE users SET ";
            
            if(this.username != null && !this.username.trim().isEmpty()){
                sql += "username = '" + this.username + "'";
            }
            
            if(this.firstName != null && !this.firstName.trim().isEmpty()){
                sql += ", ";
                sql += "firstname = '" + this.firstName + "'";
            }
            
            if(this.lastName != null && !this.lastName.trim().isEmpty()){
                sql += ", ";
                sql += "lastname = '" + this.lastName + "'";
            }
            if(this.email != null && !this.email.trim().isEmpty()){
                sql += ", ";
                sql += "email = '" + this.email + "'";
            }
            
            sql += " WHERE user_id = " + this.userID + ";";
            
            
            //System.out.println(sql);  //For debugging
            stmt.executeUpdate(sql);
            works = "updated";
            conn.close();
        }catch(Exception ex){
            System.out.println(ex);
        }
        return works;
    }
    
    public List<String> dropRolePop(){
        List<String> dropRoles = new ArrayList();
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "SELECT role FROM roles";
            
            //System.out.println(sql);  //For debugging
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                dropRoles.add(rs.getString(1));
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    
        return dropRoles;
    }
    
    public String getRoleName(String userID){
        String roleName = null;
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "SELECT roles.`role` from users\n" +
                         "LEFT JOIN roles ON users.role_id = roles.role_id\n" +
                         "WHERE user_id = " + userID ;
            
            //System.out.println(sql);  //For debugging
            ResultSet rs = stmt.executeQuery(sql);
            
            while (rs.next()) {
                roleName = rs.getString(1);
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    
        return roleName;
    }
    
    public String updateRole(){
        String works = "error";
        Connection conn = null;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            int roleID = 1;
            if("Manager".equals(this.role)){
                roleID = 2;
            }
            else if("Admin".equals(this.role)){
                roleID = 3;
            }           
            
            String sql = "UPDATE users SET role_id = " + roleID;
            sql += " WHERE user_id = " + this.userID;
            
            //System.out.println(sql);  //For debugging
            stmt.executeUpdate(sql);
            works = "updated";
            conn.close();
        }catch(Exception ex){
            System.out.println(ex);
        }
        return works;
    }
}
