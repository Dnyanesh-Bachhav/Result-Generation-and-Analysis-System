<%-- 
    Document   : ChangePassword 
    Created on : 2 Aug, 2020, 3:48:26 PM
    Author     : tppat
--%>

<%@page import="beans.Invigilator_details"%>
<%@page import="java.util.List"%>
<%@page import="mainController.HodCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body>
        <%
            String username = request.getParameter("username");
            String NewPassword = request.getParameter("password1");
            String RepeatPassword = request.getParameter("password2");
           boolean li = HodCon.changeHodPwd(username, RepeatPassword);
           if(li==true)
           {
               response.sendRedirect("../HODPanel/HODPanel.jsp");
           }
        
        %>
        
    </body>
</html>
