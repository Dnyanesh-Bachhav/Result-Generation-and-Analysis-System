<%-- 
    Document   : invigilatorLogin
    Created on : 10 Aug, 2020, 4:53:34 PM
    Author     : DELL
--%>

<%@page import="mainController.InvigilatorCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String admin_uname=request.getParameter("name");   
            String pword=request.getParameter("password");
            System.out.println("admin login check called"); 
//            if(admin_uname.equals("Administrator") && pword.equals("admin"))
            if(InvigilatorCon.login(admin_uname , pword))
            {
                session.setAttribute("invigilator_uname",admin_uname);
                session.setAttribute("invigilator_user", "invigilator");
                System.out.println("admin credentials correct hence moved to admin panel");
                response.sendRedirect("../InvigilatorsPanel/InvigilatorPanel.jsp");
                //login successful hence moved to admin panel
            }
            else
            {
                session.setAttribute("invigilator_uname", null);
                session.setAttribute("invigilator_user", null);
                response.sendRedirect("../Error.html");
                //login unsuccessful hence moved to adminLoginForm
            } 
       %>
    </body>
</html>
