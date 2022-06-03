<%-- 
    Document   : AddInvigilator
    Created on : 25 Aug, 2020, 6:51:05 PM
    Author     : tppat
--%>

<%@page import="mainController.HodCon"%>
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
            String ssubject1 = request.getParameter("specializedSubject1");
            String ssubject2 = request.getParameter("specializedSubject2");
            String ssubject3 = request.getParameter("specializedSubject3");
            String ssubject4 = request.getParameter("specializedSubject4");           
            String password =  request.getParameter("password");
            
             HodCon add = new HodCon();
             add.addInvigilator(invigilator_id,invigilator_name,qualification,experience,designation,contactNumber,address,email,allowanceKey,invigilatorBase,department,ssubject1,ssubject2,ssubject3,ssubject4,password);
            response.sendRedirect("../HODPanel/HODPanel.jsp");


           
%>
    </body>
</html>
