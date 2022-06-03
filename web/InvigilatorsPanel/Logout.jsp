<%-- 
    Document   : Logout
    Created on : 8 Nov, 2020, 2:32:24 PM
    Author     : tppat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            try{if(session.getAttribute("invigilator_user").equals("invigilator"))
            {
            session.removeAttribute("invigilator_user");
            session.removeAttribute("uname"); 
            session.removeAttribute("message");
            }}catch(Exception e){}
             response.sendRedirect("../InvigilatorsPanel/InvigilatorLogin.jsp");
    
        %>
    </body>
</html>
