import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Andrew Bellmio
 */
public class Orders extends HttpServlet {

    private HttpSession session;
    private String work_id;
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
        processRequest(request, response);
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


    public String queryOrders() {
    
        String finalOut = "DEGBUG";
        Connection conn = null;


        try{
            //open a connection
            conn = Database.getConnection();

            //initialize statement
            Statement stmt = conn.createStatement();

            //start building the query
            String sqlOrderQuery = "select work_id, from work_orders;";

            //If the work ID field has something in it, add that to the query
            if(this.work_id != null | !this.work_id.trim().isEmpty()){
                sqlOrderQuery += " WHERE work_id " + this.work_id;
            }
  

        //run the query and get the results
        ResultSet rs = stmt.executeQuery(sqlOrderQuery);

            //formatting the top of the table
            finalOut = "<table class=\"table table-bordered\" id=\"dataTable\" width=\"100%\" cellspacing=\"0\">\n" +
                                                        "<thead>\n" +
                "						<tr>\n" +
                "                                                    <th>Work Order</th>\n" +
                "                                                    <th>SKU</th>\n" +
                "						</tr>\n" +
                "					</thead>\n" +
                "					<tfoot>\n" +
                "						<tr>\n" +
                "                                                    <th>Work Order</th>\n" +
                "                                                    <th>SKU</th>\n" +
                "						</tr>\n" +
                "					</tfoot>\n" + 
                "                                       <tbody>";
                            //while the set still has output, add it in to the table
                            while (rs.next()) {
                                finalOut += "<tr>\n" +
                "                               <td>" + rs.getString(1) + "</td>\n" +
                "                               <td>" + rs.getString(2) + "</td>\n" +
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


} 