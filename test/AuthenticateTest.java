/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.Mockito.*;

/**
 *
 * @author scott
 */
public class AuthenticateTest {
    
    public AuthenticateTest() {
    }

    @Test
    public void testDoGet() throws Exception {
        System.out.println("doGet");
        HttpServletRequest request = null;
        HttpServletResponse response = null;
        Authenticate instance = new Authenticate();
        instance.doGet(request, response);
        fail("The test case is a prototype.");
    }

    @Test
    public void testDoPost() throws Exception {
        System.out.println("doPost - Correct Credentials");
        
         
        
        //Create the mock request and responses
        HttpServletRequest request = mock(HttpServletRequest.class);       
        HttpServletResponse response = mock(HttpServletResponse.class);
        HttpSession session = mock(HttpSession.class);
                
        //assign the pretend values passed to the request
        when(request.getParameter("username")).thenReturn("scott");
        when(request.getParameter("pfield")).thenReturn("Something");
        when(request.getSession()).thenReturn(session);
                     
        //run the method being tested
        new Authenticate().doPost(request, response);
        
                
        assertTrue(("scott").equals(session.getAttribute("UserName")));
        
    }

    @Test
    public void testGetServletInfo() {
        System.out.println("getServletInfo");
        Authenticate instance = new Authenticate();
        String expResult = "Manages Sign in and session creation";
        String result = instance.getServletInfo();
        assertEquals(expResult, result);
    }

    @Test
    public void testValidate() {
        System.out.println("validate");
        String name = "scott";
        String pass = "Something";
        Authenticate instance = new Authenticate();
        boolean expResult = true;
        boolean result = instance.validate(name, pass);
        assertEquals(expResult, result);
    }

    @Test
    public void testGetRole() {
        System.out.println("getRole");
        Integer userID = 1;
        Authenticate instance = new Authenticate();
        int expResult = 3;
        int result = instance.getRole(userID);
        assertEquals(expResult, result);
    }

    @Test
    public void testGetLocation() {
        System.out.println("getLocation");
        Integer userID = 1;
        Authenticate instance = new Authenticate();
        int expResult = 1;
        int result = instance.getLocation(userID);
        assertEquals(expResult, result);
    }
    
}
