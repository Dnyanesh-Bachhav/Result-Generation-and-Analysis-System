<%-- 
    Document   : Backup of Database 
    Created on : 15 Jan, 2021, 3:12:29 PM
    Author     : DELL
--%>
<%@page import="java.io.File"%>
<%@page import="java.util.Scanner"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Backup</title>
    </head>
    
        <%

      //Creating a File object
      File file = new File("C:\\Backup_RG");
      //Creating the directory
      boolean bool = file.mkdir();
      if(bool){
         System.out.println("Directory created successfully");
      }else{
         System.out.println("Sorry couldn’t create specified directory");
      }
            
            
            Runtime r = Runtime.getRuntime();
            out.print(r.exec("C:\\xampp\\mysql\\bin\\mysqlbackup.bat"));
            response.sendRedirect("../AdministratorsPanel/AdministratorPanel.jsp?");
            
        %>
    
</html>
