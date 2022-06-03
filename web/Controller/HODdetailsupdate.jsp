<%-- 
    Document   : HODdetailsupdate
    Created on : 19 Nov, 2020, 4:40:43 PM
    Author     : tppat
--%>

<%@page import="mainController.HodCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Controller</title>
    </head>
    <body>
        <%
            String fname = request.getParameter("fname");
            String lname = request.getParameter("lname");
            String education = request.getParameter("education");
            String program = request.getParameter("program");
            String usertype = request.getParameter("usertype");
            String username = request.getParameter("username");
            int shift = Integer.parseInt(request.getParameter("shift"));
            boolean state;
            
            state = HodCon.updateHodData(shift,usertype,fname,lname,username,program,education);
            if(state==true){
                response.sendRedirect("../HODPanel/HODPanel.jsp");
            }
            


        %>
    </body>
</html>
