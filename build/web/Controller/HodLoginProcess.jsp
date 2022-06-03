
Login controller for HOD

<%@page import="mainController.HodCon"%>
<%@page import="beans.Hod_data"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hod Login</title>
    </head>
    <body>
        <% 
            String hod_uname=request.getParameter("username");   
            String pword=request.getParameter("password");
            System.out.println("HOD login check called"); 
            if(HodCon.login(hod_uname,pword)) 
            {
                session.setAttribute("hod_uname",hod_uname);
                session.setAttribute("hod_user", "hod");
                System.out.println("HOD credentials correct hence moved to HOD panel");
                response.sendRedirect("../HODPanel/HODPanel.jsp");
                //login successful hence moved to admin panel
            }
            else
            {
                session.setAttribute("hod_uname", null);
                session.setAttribute("hod_user", null);  
                session.setAttribute("message", "Invalid Username or Password");
                response.sendRedirect("../HODPanel/HODLogin.jsp");
                //login unsuccessful hence moved to adminLoginForm
            } 
       %>    
    </body>
</html>
