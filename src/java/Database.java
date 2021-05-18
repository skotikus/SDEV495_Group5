/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author scott
 */

import java.sql.*;

public class Database {
    
    static {
        try{
            Class.forName("com.mysql.jdbc.Driver");
        }catch (Exception ex){
            System.out.println(ex);
        }
    }
    
    public static Connection getConnection(){
        Connection conn = null;
        String server = "jdbc:mysql://";
        String database = "";
        String username = "";
        String password = "";
        try { 
            conn = DriverManager.getConnection(server + "/" + database,username,password);
        } catch (Exception ex) {
            System.out.println(ex);
        }
        return conn;
    }
    
    
}
