<%-- 
    Document   : AddInvigilator
    Created on : 25 Aug, 2020, 6:51:05 PM
    Author     : tppat
--%>

<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Invigilator</title>
    </head>
    <body>
        <%
            String invigilator_name = request.getParameter("invigilatorName");
            String invigilator_id = request.getParameter("id");
            String qualification = request.getParameter("qualification");
            String experience =  request.getParameter("experience");
            String designation = request.getParameter("designation");
            long contactNumber=Long.parseLong(request.getParameter("contactNumber"));
            String address = request.getParameter("address");
            String email = request.getParameter("emailId");
            String allowanceKey = request.getParameter("allowanceKey");
            String invigilatorBase = request.getParameter("invigilatorBase");
            int  department=Integer.parseInt(request.getParameter("department"));
            String subject1 = request.getParameter("specializedSubject1");
            String subject2 = request.getParameter("specializedSubject2");
            String subject3 = request.getParameter("specializedSubject3");
            String subject4 = request.getParameter("specializedSubject4");           
            String password =  request.getParameter("password");
            
            
            AdminCon.registerInvigilator(invigilator_id,password,invigilator_name,invigilatorBase,department,designation,allowanceKey,email,contactNumber,qualification,experience,subject1,subject2,subject3,subject4,address);
            response.sendRedirect("../AdministratorsPanel/AdministratorPanel.jsp");


           
%>
    </body>
</html>
