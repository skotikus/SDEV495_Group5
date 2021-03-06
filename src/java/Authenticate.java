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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Authenticate extends HttpServlet {

    // variables    
    private String username;
    private String pword;
    private Boolean isValid;
    private int user_id;
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
            out.println("<title>Servlet Authenticate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Authenticate at " + request.getContextPath() + "</h1>");
            out.println("<h1>Results are " + username + "," + isValid + "</h1>");
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
        this.username = request.getParameter("username");
        this.pword = request.getParameter("pfield");
        this.isValid = validate(this.username, this.pword);
         response.setContentType("text/html;charset=UTF-8");
        // Set the session variable
        if (isValid) {
            // Create a session object if it is already not created.
            session = request.getSession(true);
            session.setAttribute("UserName", this.username);         
            session.setAttribute("UserID", this.user_id);
            session.setAttribute("Role", getRole(this.user_id));
            session.setAttribute("Location", getLocation(this.user_id));

            // Send to the Home JSP page via dashboard servlet            
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/Dashboard");
            dispatcher.forward(request, response);

        } else {
            // Not a valid login
            // refer them back to the Login screen
            request.setAttribute("ErrorMessage", "Invalid Username or Password.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
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
        return "Manages Sign in and session creation";
    }// </editor-fold>

    // Method to Authenticate
    public boolean validate(String name, String pass) {
        boolean status = false;
        int hitcnt=0;
        Connection conn;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select user_id from users where username = '" + this.username + "'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                this.user_id = rs.getInt(1);
            }
            if (this.user_id > 0) {                
                String sql2 = "select user_id from user_info where user_id = " + this.user_id + " and password COLLATE utf8_bin = '" + this.pword + "'";
                ResultSet rs2 = stmt.executeQuery(sql2);
                while (rs2.next()) {
                    hitcnt++;
                }   
                // Set to true if userid/password match
               if(hitcnt>0){
                   status=true;
               }
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return status;
    }
    
    public int getRole(Integer userID){
        
        int role = 0;
        Connection conn;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "select role_id from users where user_id = " + userID;
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                role = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return role;
    }
    
    public int getLocation(Integer userID){
        
        int loc = 0;
        Connection conn;
        try {
            conn = Database.getConnection();
            Statement stmt = conn.createStatement();
            String sql = "SELECT loc_id from users WHERE user_id = " + userID;
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                loc = rs.getInt(1);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return loc;
    }

}
