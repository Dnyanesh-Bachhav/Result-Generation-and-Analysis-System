<%-- 
    Document   : clearResultTables
    Created on : 18 Apr, 2021, 10:10:59 AM
    Author     : DELL
--%>

<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clear Result</title>
    </head>
    <body>
        <%
           int returnVal = AdminCon.clearResultTables();
//           out.print(returnVal);s
           
           session.setAttribute("clearResultValue", returnVal);
           response.sendRedirect("declareResultInstructions.jsp");
        %>
    </body>
</html>
