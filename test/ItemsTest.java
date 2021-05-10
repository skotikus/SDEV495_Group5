/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author scott
 */
public class ItemsTest {
    
    public ItemsTest() {
    }

    @Test
    public void testProcessRequest() throws Exception {
        System.out.println("processRequest");
        HttpServletRequest request = null;
        HttpServletResponse response = null;
        Items instance = new Items();
        instance.processRequest(request, response);
        fail("The test case is a prototype.");
    }

    @Test
    public void testDoGet() throws Exception {
        System.out.println("doGet");
        HttpServletRequest request = null;
        HttpServletResponse response = null;
        Items instance = new Items();
        instance.doGet(request, response);
        fail("The test case is a prototype.");
    }

    @Test
    public void testDoPost() throws Exception {
        System.out.println("doPost");
        HttpServletRequest request = null;
        HttpServletResponse response = null;
        Items instance = new Items();
        instance.doPost(request, response);
        fail("The test case is a prototype.");
    }

    @Test
    public void testGetServletInfo() {
        System.out.println("getServletInfo");
        Items instance = new Items();
        String expResult = "";
        String result = instance.getServletInfo();
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testListItems() {
        System.out.println("listItems");
        Items instance = new Items();
        String expResult = "1";
        String result = instance.listItems();
        assertEquals(expResult,1);
    }

    @Test
    public void testGetItem() {
        System.out.println("getItem");
        String itemID = "";
        Items instance = new Items();
        List<String> expResult = null;
        List<String> result = instance.getItem(itemID);
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testDeleteItem() {
        System.out.println("deleteItem");
        Items instance = new Items();
        String expResult = "";
        String result = instance.deleteItem();
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testNewItem() {
        System.out.println("newItem");
        Items instance = new Items();
        String expResult = "";
        String result = instance.newItem();
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }

    @Test
    public void testUpdateItem() {
        System.out.println("updateItem");
        Items instance = new Items();
        String expResult = "";
        String result = instance.updateItem();
        assertEquals(expResult, result);
        fail("The test case is a prototype.");
    }
    
}
