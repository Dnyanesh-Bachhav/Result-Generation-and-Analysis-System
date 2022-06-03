<%-- 
    Document   : Controller for admin password change
    Created on : 3 Aug, 2020, 6:02:48 PM
    Author     : DELL
--%>

<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String AdminName = request.getParameter("username");
            String newAdminPassword = request.getParameter("password2");
//            out.print(AdminName);
//            out.print(newAdminPassword);
            Boolean getValue = AdminCon.changePassword(AdminName, newAdminPassword);
            if(getValue == true)
            {
//                System.out.println("New Admin account created successfully...!!!");
                response.sendRedirect("../AdministratorsPanel/AdministratorPanel.jsp");
            }
            else
            System.out.println("Error occured while creating account...!!!");
        %>
    </body>
</html>
