<%-- 
    Document   : Login Controller of invigilator
    Created on : 27 Aug, 2020, 6:29:32 PM
    Author     : DELL
--%>

<%@page import="mainController.invigilatorsCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String invigilator_name=request.getParameter("name");   
            String pword=request.getParameter("password");
            System.out.println("admin login check called");
            if(invigilatorsCon.login(invigilator_name , pword))
            {
                session.setAttribute("uname", invigilator_name);
                session.setAttribute("invigilator_user", "invigilator");
          
                System.out.println("admin credentials correct hence moved to admin panel");
                response.sendRedirect("invigilatorPanel.jsp");
                //login successful hence moved to admin panel
            }
            else
            {
                session.setAttribute("message", "Invalid Username or Password");
                response.sendRedirect("../InvigilatorsPanel/InvigilatorLogin.jsp");
                //login unsuccessful hence moved to adminLoginForm
            }
       %>
    </body>
</html>
