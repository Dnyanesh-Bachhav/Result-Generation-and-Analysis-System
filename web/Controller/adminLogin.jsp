<%-- 
    Document   : Controller of admin login
    Created on : 25 Jul, 2020, 6:41:00 PM
    Author     : DELL
--%>
<%@page import="mainController.AdminCon" %>
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
            if(AdminCon.login(admin_uname , pword))
            {
                session.setAttribute("admin_uname",admin_uname);
                session.setAttribute("pword", pword);
                session.setAttribute("admin_user", "admin");
                System.out.println("admin credentials correct hence moved to admin panel");
                response.sendRedirect("../AdministratorsPanel/AdministratorPanel.jsp");
                //login successful hence moved to admin panel
            }
            else
            {
                session.setAttribute("admin_uname", null);
                session.setAttribute("admin_user", null);
                session.setAttribute("message", "Invalid Username or Password");
                //request.getRequestDispatcher("../AdministratorsPanel/AdministratorLogin.jsp").forward(request, response);
               response.sendRedirect("../AdministratorsPanel/AdministratorLogin.jsp");
                //login unsuccessful hence moved to adminLoginForm
            } 
       %> 
    </body>
</html>
