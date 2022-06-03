<%-- 
    Document   : logout
    Created on : Jul 28, 2018, 11:41:05 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <%
             
            try{if(session.getAttribute("admin_user").equals("admin"))
            {
            session.removeAttribute("admin_user");
            session.removeAttribute("admin_uname"); 
            session.removeAttribute("message");
            }}catch(Exception e){}
             response.sendRedirect("../AdministratorsPanel/AdministratorLogin.jsp");
    
        %>
        
        <script>
            localStorage.removeItem("show_tooltip");
        </script>
    </body>
</html>
